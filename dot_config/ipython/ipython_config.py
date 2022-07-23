import os

c.BaseIPythonApplication.ipython_dir = f"{os.getenv('XDG_CONFIG_HOME')}/ipython"

c.TerminalIPythonApp.display_banner = True

c.InteractiveShellApp.log_level = 20
c.InteractiveShellApp.exec_lines = [
  "import numpy as np",
  "import scipy as sp",
  "import pandas as pd",
]

c.InteractiveShell.pdb = True

c.TerminalInteractiveShell.editor = "nvim"
c.TerminalInteractiveShell.auto_match = True
c.TerminalInteractiveShell.autoformatter = "black'"
c.TerminalInteractiveShell.editing_mode = "vi"
c.TerminalInteractiveShell.editor = "nvim"
c.TerminalInteractiveShell.pdb = True
