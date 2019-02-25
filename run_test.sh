#!/bin/bash
set -u
set -e

#env

echo "$ENV"

if [ $ENV == "devstack1" ]
then
	unset HTTP_PROXY
elif [ $ENV == "devstack2" ]
then
	unset HTTP_PROXY
fi


echo "Run Tests... on $ENV"
env


source config/$ENV/tenant1.rc

#setup the temporary  directory for running the test
mkdir testrun
# copy the environment and test in this folder
cp config/$ENV/* testrun/.
cp config/test-key testrun/.
cp config/test-key.pub testrun/.

cp tests/$TEST testrun/.

make -C testrun -f Makefile


#delete the working dir
#rm -rf testrun


