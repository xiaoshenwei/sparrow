#!/bin/bash
# shellcheck disable=SC1090

. "$SPARROW_SRC/lib/debug.sh"

is_abs_path() {
	[[ "${1:0:1}" = "/" ]]
}

abs_path() {
	local path="$1"
	if is_abs_path "$path"; then
		echo "$path"
	else
		echo "$PWD"/"$path"
	fi
}

echo_run() {
	echo "$@"
	"$@"
}

echo_exec() {
	echo "$@"
	exec "$@"
}

query_var_from_yaml() {
	local key=$1
	local yaml_file=${2:--}
	[ $# -ge 1 ] || die "Invalid parmeters: $*"

	sed -ne "1,\$s/^${key}[[:space:]]*:[[:space:]]*\\(.*\\)[[:space:]]*\$/\\1/p" "$yaml_file"
}

#
