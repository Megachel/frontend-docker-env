#!/bin/sh
# wait-for-mysql.sh

set -e

seconds="$1"
shift
cmd="$@"

sleep $seconds
exec $cmd