#!/bin/bash

mv /etc/samba/smb.conf /etc/samba/smb.orig
mv /etc/krb5.conf /etc/krb5.conf_orig
samba-tool domain provision --server-role=dc --use-rfc2307 --dns-backend=SAMBA_INTERNAL --realm=ARM-24.NET --domain=ARM-24 --adminpass=Qwerty123
touch /etc/krb5.conf
touch /var/log/krb5.log
echo "[libdefaults]" >> /etc/krb5.conf
echo "	default_realm = ARM-24.NET" >> /etc/krb5.conf
echo "	dns_lookup_realm = false" >> /etc/krb5.conf
echo "	dns_lookup_kdc = true" >> /etc/krb5.conf
echo "	" >> /etc/krb5.conf
echo "[realms]" >> /etc/krb5.conf
echo "	ARM-24.NET = {" >> /etc/krb5.conf 
echo "	kdc = $hostname.arm-24.net" >> /etc/krb5.conf
echo "	admin_server = $hostname.arm-24.net" >> /etc/krb5.conf
echo "	default_domain = ARM-24.NET" >> /etc/krb5.conf
echo "	}" >> /etc/krb5.conf
echo "	" >> /etc/krb5.conf
echo "[domain_realm]" >> /etc/krb5.conf
echo "	.ARM-24.NET = ARM-24.NET" >> /etc/krb5.conf
echo "	ARM-24.NET = ARM-24.NET" >> /etc/krb5.conf
echo "	" >> /etc/krb5.conf
echo "[logging]" >> /etc/krb5.conf
echo "	default = FILE:/var/log/krb5.log" >> /etc/krb5.conf