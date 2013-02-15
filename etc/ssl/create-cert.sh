#!/bin/bash

set -e
hostname=$1

if [[ -z "$hostname" ]]; then
    echo "Usage: $0 [hostname]"
    exit 1
fi

key=private/$hostname.key
csr=$hostname.csr
pem=certs/$hostname.pem

if [[ -e $key ]]; then
    mv --backup=numbered $key $key.backup
fi
if [[ -e $key ]]; then
    mv --backup=numbered $pem $pem.backup
fi


subject="/C=AT/ST=Vienna/L=Vienna/O=Österreichische HochschülerInnenschaft/OU=Fachschaft Informatik/emailAddress=root@fsinf.at/CN=$hostname/"

# generate private key
openssl genrsa -out $key 4096 > /dev/null 2> /dev/null
openssl req -new -key $key -out $csr -utf8 -batch -subj "$subject" > /dev/null
cat $csr

read

vim $pem

rm $csr

apache2ctl -t && /etc/init.d/apache2 restart