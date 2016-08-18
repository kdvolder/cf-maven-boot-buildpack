#!/bin/bash
set -e

echo KDV_TEST=$KDV_TEST
echo VCAP_APPLICATION=$VCAP_APPLICATION

echo STARTING ORION
export PATH=${PATH}:${HOME}/nodejs/node-v4.5.0-linux-x64/bin:${HOME}/node_modules/.bin
pushd node_modules/orion-duck-tape
npm start &
popd

targetRoot=${HOME}/classpath/BOOT-INF/classes

echo STARTING JAVA APP
$JAVA_HOME/bin/java \
    -Dsourceroot=${HOME}/src/main/java \
    -Dtargetroot=${targetRoot} \
    -Dspring.devtools.restart.additional-paths=${targetRoot}
    -cp ${HOME}/classpath \
    org.springframework.boot.loader.JarLauncher

