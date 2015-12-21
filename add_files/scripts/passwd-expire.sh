#!/bin/bash
# @(#) edit password expire. It is as same as "samba-tool domain passwordsettings set --max-pwd-age=${1}".

/scripts/samba-tool.sh domain passwordsettings set --max-pwd-age="${1}"
