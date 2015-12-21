#!/bin/bash
# @(#) add samba user. It is as same as "samba-tool user create".

/scripts/samba-tool.sh user create "${@}"
