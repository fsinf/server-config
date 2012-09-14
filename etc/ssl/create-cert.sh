#!/bin/bash

set -e
hostname=$1

key=private/$hostname.key
csr=$hostname.csr
pem=certs/$hostname.pem

mv $key $key.backup
mv $pem $pem.backup


subject="/C=AT/ST=Vienna/L=Vienna/O=Österreichische HochschülerInnenschaft/OU=Fachschaft Informatik/emailAddress=root@fsinf.at/CN=$hostname/"

# generate private key
openssl genrsa -out $key 4096 > /dev/null 2> /dev/null
openssl req -new -key $key -out $csr -utf8 -batch -subj "$subject" > /dev/null
cat $csr

read

vim $pem

rm $csr

apache2ctl -t && /etc/init.d/apache2 restart
