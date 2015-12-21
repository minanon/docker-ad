#!/bin/bash
# @(#) change password for samba user. It is as same as "samba-tool user setpassword ${1} --newpassword=<input password>".

echo -n 'Please input new password: '
read -sr passwd
/scripts/samba-tool.sh user setpassword "${@}" --newpassword=${passwd}
