#!/bin/bash

rm -rf /etc/samba/smb.conf /var/lib/samba/sysvol/ /var/lib/samba/private/*
samba-tool domain provision --use-rfc2307 --function-level=2008_R2 --domain=LOCAL --realm=LOCAL.YM --adminpass=test-1234 --dns-backend=BIND9_DLZ --server-role=dc
