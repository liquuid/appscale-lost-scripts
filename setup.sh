#!/bin/bash

# Stop execution on error
set -e

DIR=`dirname $0`

$DIR/appscale-up.sh $2 $3

$DIR/fix-domain.sh $1