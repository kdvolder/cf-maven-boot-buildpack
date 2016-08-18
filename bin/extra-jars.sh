echo "Adding extra JARS on the classpath"
appDir=$1
cacheDir=$2
classpathDir=${appDir}/classpath/BOOT-INF/lib

ideVersion=0.0.3
devtoolsVersion=1.4.0.RELEASE
collectionsVersion=3.2.2

ideUrl=http://aboyko-ide-jar-server.cfapps.io/ide/ide-${ideVersion}.jar
devtoolsUrl=http://central.maven.org/maven2/org/springframework/boot/spring-boot-devtools/${devtoolsVersion}/spring-boot-devtools-${devtoolsVersion}.jar
collectionsUrl=http://central.maven.org/maven2/commons-collections/commons-collections/${collectionsVersion}/commons-collections-${collectionsVersion}.jar

##############################################################################################
# Add IDE JAR
##############################################################################################

echo "===== Adding IDE JAR ====="
cd $cacheDir
if [ -f ide-${ideVersion}.jar ]; then
    echo "Found ide-${ideVersion}.jar in cache"
else
    wget $ideUrl -O ide-${ideVersion}.jar
fi

cp -v ide-${ideVersion}.jar ${classpathDir}/ide-${ideVersion}.jar

##############################################################################################
# Add DevTools Jar
##############################################################################################

echo "===== Adding DevTools JAR ====="
cd $cacheDir
if [ -f spring-boot-devtools-${devtoolsVersion}.jar ]; then
echo "Found spring-boot-devtools.jar in cache"
else
wget $devtoolsUrl -O spring-boot-devtools-${devtoolsVersion}.jar
fi

cp -v spring-boot-devtools-${devtoolsVersion}.jar ${classpathDir}/spring-boot-devtools-${devtoolsVersion}.jar

##############################################################################################
# Add Collections Jar
##############################################################################################

echo "===== Adding Collections JAR ====="
cd $cacheDir
if [ -f commons-collections-${collectionsVersion}.jar ]; then
    echo "Found spring-boot-devtools.jar in cache"
else
    wget $devtoolsUrl -O commons-collections-${collectionsVersion}.jar
fi

cp -v commons-collections-${collectionsVersion}.jar ${classpathDir}/commons-collections-${collectionsVersion}.jar

