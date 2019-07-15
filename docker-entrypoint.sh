#!/bin/sh

set -e

if [ $# -eq 1 -a "${1: -5}" = ".conf" ]
then
	set -- /usr/sbin/named -f -u named -c "$@"
fi

if [ "${1#-}" != "$1" ]
then
	set -- /usr/sbin/named "$@"
fi

exec "$@"
