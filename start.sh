#!/bin/bash
echo KDV_TEST=$KDV_TEST
echo VCAP_APPLICATION=$VCAP_APPLICATION

echo STARTING JAVA APP
$JAVA_HOME/bin/java -cp ${HOME}/classpath org.springframework.boot.loader.JarLauncher
