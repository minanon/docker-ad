#!/bin/bash
# @(#) provision samba config. It is as same as "samba-tool domain provision".

rm -rf /etc/samba/smb.conf /var/lib/samba/sysvol/ /var/lib/samba/private/*
mkdir -p /var/lib/samba/usershares /var/lib/samba/printers/{COLOR,IA64,W32ALPHA,W32MIPS,W32PPC,W32X86,WIN40,x64}
chgrp sambashare /var/lib/samba/usershares
chmod 1770 /var/lib/samba/usershares


/scripts/samba-tool.sh domain provision "${@}"
