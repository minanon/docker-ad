#!/bin/bash
# @(#) add samba user. It is as same as "samba-tool user create".

set -eu

/scripts/samba-tool.sh user create "${@}"

samba-tool user setexpiry "${1}" --noexpiry
