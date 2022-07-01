#!/usr/bin/env python
from functools import partial
import shutil
import shlex
import subprocess
from typing import Dict, List
import tempfile
from subprocess import PIPE, run as sprun
import pathlib

import click
import pandas as pd


@click.group(invoke_without_command=True)
@click.pass_context
def cli(ctx: click.Context) -> None:
    pass


@cli.command()
@click.option("n_reps", "-n", "--n-reps", type=int, required=True)
@click.option(
    "--save",
    type=click.Path(dir_okay=False, writable=True, path_type=pathlib.Path),
    default=None,
    help="File path to save CSV to.",
)
def run(n_reps: int, save: pathlib.Path = None) -> None:
    """Run `n_reps` for `speedtest-cli` and compute statistics."""
    srun = partial(sprun, stdout=PIPE, stderr=PIPE, universal_newlines=True)

    speedtest = srun(shlex.split("brew --prefix speedtest")).stdout.strip() + "/bin/speedtest"
    print(f"Found `speedtest` at {speedtest}...")

    tmp = tempfile.NamedTemporaryFile("w", encoding="utf-8", buffering=1)

    header = srun(shlex.split(f"{speedtest} --csv-header")).stdout
    tmp.write(header)

    with click.progressbar(range(n_reps), label="Running SpeedTest") as pbar:
        for step in pbar:
            entry = srun(shlex.split(f"{speedtest} --csv")).stdout
            tmp.write(entry)

    # Columns: (last inspected on 22 Sep 2021)
    # Server ID,Sponsor,Server Name,Timestamp,Distance,Ping,Download,Upload,Share,IP Address
    df = pd.read_csv(tmp.name)
    df = df[["Server ID", "Distance", "Ping", "Upload", "Download"]]

    # 8 bits/byte * 1000 bytes/kbyte * 1000 kbyte/mbyte
    df[["Upload", "Download"]] /= 8 * 1000 * 1000
    upload = df["Upload"]
    download = df["Download"]

    p = "------------------------------------------------------------------------------"
    pad = lambda s: f"- {s} {p[len(s) + 1:]}"

    def pprint(tag: str, data: pd.Series) -> List[str]:
        return " ".join(
            [
                click.style(f"{tag:10s}:", bold=True),
                click.style(f"{data.mean():6.2f}", bold=True),
                click.style(f"({data.std():6.2f}) MB/s"),
            ]
        )

    click.secho(pprint("Upload", upload), fg="magenta")
    click.secho(pprint("Download", download), fg="blue")

    if save:
        if ".csv" not in save.suffixes:
            save = save.with_suffix("".join(save.suffixes + [".csv"]))
        shutil.copy(tmp.name, save)

    tmp.close()


@cli.command()
def edit() -> None:
    """Edit the backing Python file."""
    click.edit(filename=pathlib.Path(__file__))


if __name__ == "__main__":
    cli()
