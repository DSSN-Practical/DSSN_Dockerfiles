#!/bin/bash

set -m

tail -f -n0 /var/lib/virtuoso-opensource-6.1/db/virtuoso.log &

# start the virtuoso service
echo "starting virtuoso..."
service virtuoso-opensource-6.1 start
echo "start finshed, tailing VOS log:"
#bring tail for log outputs back to front
fg
