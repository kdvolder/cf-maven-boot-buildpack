#!/bin/bash
set -e

echo KDV_TEST=$KDV_TEST
echo VCAP_APPLICATION=$VCAP_APPLICATION

echo STARTING ORION
export PATH=${PATH}:${HOME}/nodejs/node-v4.5.0-linux-x64/bin:${HOME}/node_modules/.bin
orion -p 9000 &

echo STARTING JAVA APP
$JAVA_HOME/bin/java -cp ${HOME}/classpath org.springframework.boot.loader.JarLauncher

