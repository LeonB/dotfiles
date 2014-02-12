#!/bin/sh
#
# usage:  import-cert.sh remote.host.name [port]
#
REMHOST=$1
REMPORT=${2:-443}
exec 6>&1
exec > $REMHOST
echo | openssl s_client -connect ${REMHOST}:${REMPORT} 2>&1 |sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'
certutil -d sql:$HOME/.pki/nssdb -A -t TC -n "$REMHOST" -i $REMHOST 
#certutil -d sql:$HOME/.pki/nssdb -A -t "TC,," -n "$REMHOST" -i $REMHOST 
exec 1>&6 6>&-

#Root certificate
#https://windows.box.com/certsrv
#https://windows.box.com/certsrv/certnew.cer?ReqID=CACert&Renewal=0&Mode=inst&Enc=b64
#certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -i /home/leon/Downloads/certnew\ \(1\).cer -n Tim_online

#wget -O cacert-root.crt "http://www.cacert.org/certs/root.crt"
#wget -O cacert-class3.crt "http://www.cacert.org/certs/class3.crt"

#certutil -d sql:$HOME/.pki/nssdb -A -t TC -n "CAcert.org" -i cacert-root.crt 
#certutil -d sql:$HOME/.pki/nssdb -A -t TC -n "CAcert.org Class 3" -i cacert-class3.crt
