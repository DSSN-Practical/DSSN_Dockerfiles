#!/bin/bash

# shutdown allowing for clean shutdown of daemons
cleanup () {
  echo "stopping nginx..."
  service nginx stop
  
  echo "stopping php..." 
  service php5-fpm stop
  
  echo "stopping tail of log..."
  [[ -n $tailpid ]] && kill "$tailpid"

  exit 0
}

trap 'cleanup' INT TERM

# start the php5-fpm service
echo "starting php..."
service php5-fpm start

# start the nginx service
echo "starting nginx..."
service nginx start

echo "Xodx is ready to set sail!"
cat /xodx-docker.fig
echo ""
echo "following log (press Ctrl + C to shut down this node):"

tail -f $LOG &
tailpid=$!

wait #on tail
