#!/usr/bin/env bash
#set -x

# for Mac OS X
export COPYFILE_DISABLE=true

PWD=`pwd`
app=`basename $PWD`
version=`grep 'version =' ${app}/default/app.conf | awk '{print $3}' | sed 's/\.//g'`

rm -f ${app}_*.tgz
tar -czf ${app}_${version}.tgz --exclude=${app}/local --exclude=${app}/metadata/local.meta ${app}
echo "Wrote: ${app}_${version}.tgz"

exit 0
