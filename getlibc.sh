#!/usr/bin/env sh
# shellcheck disable=SC2317

# Pulled from: https://github.com/twpayne/chezmoi/blob/d3e3fa/assets/scripts/install.sh#L333-L355
is_command() {
	type "${1}" >/dev/null 2>&1
}

log_debug() {
	[ 3 -le "${LOG_LEVEL}" ] || return 0
	printf 'debug %s\n' "${*}" 1>&2
}

log_info() {
	[ 2 -le "${LOG_LEVEL}" ] || return 0
	printf 'info %s\n' "${*}" 1>&2
}

log_err() {
	[ 1 -le "${LOG_LEVEL}" ] || return 0
	printf 'error %s\n' "${*}" 1>&2
}

log_crit() {
	[ 0 -le "${LOG_LEVEL}" ] || return 0
	printf 'critical %s\n' "${*}" 1>&2
}

# Adapted from: https://github.com/twpayne/chezmoi/blob/d3e3fa/assets/scripts/install.sh#L188-L211
if is_command ldd; then
	case "$(ldd --version 2>&1 | tr '[:upper:]' '[:lower:]')" in
		*glibc* | *"gnu libc"*)
			printf glibc
			exit 0
			;;
		*musl*)
			printf musl
			exit 0
			;;
		esac
fi
if is_command getconf; then
	case "$(getconf GNU_LIBC_VERSION 2>&1)" in
		*glibc*)
			printf glibc
			exit 0
			;;
	esac
fi

log_crit "unable to determine libc" 1>&2
exit 1
