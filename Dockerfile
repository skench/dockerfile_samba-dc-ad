FROM debian:stretch-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y samba winbind libpam-winbind libnss-winbind \
samba-dsdb-modules smbclient libpam-krb5 krb5-user krb5-kdc krb5-config vim

ADD samba-tools.sh /samba-tools.sh
RUN chmod +x /samba-tools.sh
CMD /samba-tools.sh

ADD script_samba.sh /script_samba.sh
RUN chmod +x /script_samba.sh

ADD script_krb5.sh /script_krb5.sh
RUN chmod +x /script_krb5.sh

CMD ["bash"]
