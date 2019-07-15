#!/bin/sh

set -e

if [ $# -eq 1 -a -e "$1" -a ! -x "$1" ]
then
	set -- /usr/sbin/named -f -u named -c "$@"
fi

if [ "${1#-}" != "$1" ]
then
	set -- /usr/sbin/named "$@"
fi

exec "$@"
