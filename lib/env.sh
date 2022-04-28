#!/bin/bash
# shellcheck disable=SC1090

if command -v command >/dev/null 2>&1; then
	has_cmd() {
		command -v "$1" >/dev/null
	}

	cmd_path() {
		command -v "$1"
	}
else
	has_cmd() {
		type "$1" >/dev/null 2>&1
	}

	cmd_path() {
		has_cmd "$1" && which "$1"
	}
fi

# gawk has a known bug
# awk: fatal error: internal error: segfault
if has_cmd mawk; then
	__mawk_cmd=$(cmd_path mawk)
	awk() {
		$__mawk_cmd "$@"
	}
fi

is_clearlinux() {
	[ -f /usr/lib/os-release ] && grep -qw "Clear Linux" /usr/lib/os-release
}

is_aliyunos() {
	[ -f /etc/redhat-release ] && grep -qw "Aliyun Linux" /etc/redhat-release
}

is_docker() {
	[ -f /.dockerenv ]
}

is_system() {
	[ "$(uname -s)" = "$1" ]
}

shell_profile() {
	local profile="$HOME/.${SHELL##*/}rc"
	[ -f "$profile" ] || touch "$profile"
	echo "$profile"
}

write_shell_profile() {
	shell_profile_file=$(shell_profile)
	if [ $# -gt 0 ]; then
		echo "$@" >>"$shell_profile_file"
	fi

	source "$shell_profile_file"
}
