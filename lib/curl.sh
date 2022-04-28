#!/bin/sh

setup_curl() {
	http_client_cmd=$(cmd_path curl) || return
	http_client_cmd="$http_client_cmd -sSf"
}

[ -n "$http_client_cmd" ] || setup_curl || return
