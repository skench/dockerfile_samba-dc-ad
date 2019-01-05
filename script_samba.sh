#!/bin/bash
mv /etc/samba/smb.conf /etc/samba/smb.orig
# echo $HOSTNAME 
echo "# Global parameters" >> /etc/samba/smb.conf
echo "	netbios name = $HOSTNAME" >> /etc/samba/smb.conf
echo "	realm = ARM-24.NET" >> /etc/samba/smb.conf
echo "	workgroup = ARM-24" >> /etc/samba/smb.conf
echo "	dns forwarder = 91.232.132.10" >> /etc/samba/smb.conf
echo "	server role = active directory domain controller" >> /etc/samba/smb.conf
echo "	idmap_ldb:use rfc2307 = yes" >> /etc/samba/smb.conf
echo "	" >> /etc/samba/smb.conf
echo "[netlogon]" >> /etc/samba/smb.conf
echo "	path = /var/lib/samba/sysvol/arm-24.net/scripts" >> /etc/samba/smb.conf
echo "	read only = No" >> /etc/samba/smb.conf
echo "	" >> /etc/samba/smb.conf
echo "[sysvol]" >> /etc/samba/smb.conf
echo "	path = /var/lib/samba/sysvol" >> /etc/samba/smb.conf
echo "	read only = No" >> /etc/samba/smb.conf


