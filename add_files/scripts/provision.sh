#!/bin/bash
# @(#) provision samba config. It is as same as "samba-tool domain provision".

rm -rf /etc/samba/smb.conf /var/lib/samba/sysvol/ /var/lib/samba/private/*
samba-tool domain provision "${@}"
