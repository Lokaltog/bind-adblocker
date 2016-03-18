#!/bin/sh
# Create a blacklist for common ad network and malware domains

TMPFILE=$(mktemp /tmp/adblocker.XXXXXX.tmp)
DBFILE=trusted-view/rpz.lokaltog.net-blacklist.db

# Yoyo ad network and tracking blacklist
curl --silent 'https://pgl.yoyo.org/as/serverlist.php?hostformat=nohtml&showintro=0' >> $TMPFILE
# Malwaredomains domain blacklist
curl --silent 'http://mirror1.malwaredomains.com/files/spywaredomains.zones' | sed -e '/^\/\/.*$/d;s/^zone "\([^"]\+\)".*$/\1/' >> $TMPFILE

cat $TMPFILE | uniq | sort | sed -e 's/\(.\+\)$/\1 IN CNAME .\n*.\1 IN CNAME ./' > $DBFILE
rm $TMPFILE
