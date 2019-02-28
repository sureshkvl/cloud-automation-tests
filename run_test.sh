#!/bin/bash
set -u
set -e

#env
export ENV=devstack
export TEST=webserver
#echo "$ENV"

if [ $ENV == "devstack" ]
then
	unset HTTP_PROXY
elif [ $ENV == "devstack1" ]
then
	unset HTTP_PROXY
fi

echo "Run Tests... on $ENV"
#env


source config/$ENV/tenant1.rc

#setup the temporary  directory for running the test
#check and delete testrun directory if exists??
mkdir testrun
# copy the environment and test in this folder
cp config/$ENV/* testrun/.
cp config/test-key testrun/.
cp config/test-key.pub testrun/.

chmod 400 testrun/test-key

cp tests/$TEST/* testrun/.

make -C testrun -f Makefile


#delete the working dir
#rm -rf testrun


