#!/bin/bash

service virtuoso-opensource-6.1 start
# preferable to service virtuoso-opensource-6.1 stop due to graceful shutdown
isql-vt exec='shutdown;'
