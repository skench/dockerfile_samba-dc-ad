#!/bin/bash

mv /etc/krb5.conf /etc/krb5.conf.orig
touch /etc/krb5.conf
touch /var/log/krb5.log
echo "[libdefaults]" >> /etc/krb5.conf
echo "	default_realm = ARM-24.NET" >> /etc/krb5.conf
echo "	dns_lookup_realm = false" >> /etc/krb5.conf
echo "	dns_lookup_kdc = true" >> /etc/krb5.conf
echo "	" >> /etc/krb5.conf
echo "[realms]" >> /etc/krb5.conf
echo "	ARM-24.NET = {" >> /etc/krb5.conf 
echo "	kdc = debian9dc.arm-24.net" >> /etc/krb5.conf
echo "	admin_server = debian9dc.arm-24.net" >> /etc/krb5.conf
echo "	default_domain = ARM-24.NET" >> /etc/krb5.conf
echo "	}" >> /etc/krb5.conf
echo "	" >> /etc/krb5.conf
echo "[domain_realm]" >> /etc/krb5.conf
echo "	.ARM-24.NET = ARM-24.NET" >> /etc/krb5.conf
echo "	ARM-24.NET = ARM-24.NET" >> /etc/krb5.conf
echo "	" >> /etc/krb5.conf
echo "[logging]" >> /etc/krb5.conf
echo "	default = FILE:/var/log/krb5.log" >> /etc/krb5.conf
