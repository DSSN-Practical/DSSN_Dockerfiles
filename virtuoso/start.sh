#!/bin/bash

# shutdown allowing for clean shutdown of daemons
cleanup () {
  echo "stopping nginx..."
  service virtuoso-opensource-6.1 stop  

  echo "stopping tail of log..."
  [[ -n $tailpid ]] && kill "$tailpid"

  exit 0
}

trap 'cleanup' INT TERM

# start the virtuoso service
echo "starting virtuoso..."
service virtuoso-opensource-6.1 start

echo "start finshed, tailing VOS log (press Ctrl + C to shut down this node):"
tail -f /var/lib/virtuoso-opensource-6.1/db/virtuoso.log &
tailpid=$!

wait #on tail
