#!/bin/bash
set -u
set -e

#env
export ENV=devstack
export TEST=sg
#echo "$ENV"

if [ $ENV == "devstack" ]
then
	unset HTTP_PROXY
elif [ $ENV == "devstack1" ]
then
	unset HTTP_PROXY
fi


echo "*********************************************************"
echo "***** Test Environment :   $ENV"
echo "***** Test Case Name :   $TEST"
echo "*********************************************************"

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

source testrun/tenant1.rc

now=$(date +"%T")

echo "**** Test Start Time :   $now"

make -C testrun -f Makefile

echo "*********************************************************"
echo "**** Test End Time :   $now"
echo "*********************************************************"
#delete the working dir
#rm -rf testrun


