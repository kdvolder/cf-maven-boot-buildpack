echo "Adding extra JARS on the classpath"
appDir=$1
cacheDir=$2
classpathDir=${appDir}/classpath/BOOT-INF/lib

ideVersion=0.0.3
devtoolsVersion=1.4.0.RELEASE
collectionsVersion=3.2.2
zuulVersion=1.1.0

ideUrl=http://aboyko-ide-jar-server.cfapps.io/ide/ide-${ideVersion}.jar
devtoolsUrl=http://central.maven.org/maven2/org/springframework/boot/spring-boot-devtools/${devtoolsVersion}/spring-boot-devtools-${devtoolsVersion}.jar
collectionsUrl=http://central.maven.org/maven2/commons-collections/commons-collections/${collectionsVersion}/commons-collections-${collectionsVersion}.jar
zuulUrl=http://central.maven.org/maven2/com/netflix/zuul/zuul-core/${zuulVersion}/zuul-core-${zuulVersion}.jar

addJar() {
    local file = $1
    local url = $2
    local message = $3
    echo ${message}
    cd $cacheDir
    if [ -f ${file} ]; then
        echo "Found ${file} in cache"
    else
        wget $url -O $file
    fi
    cp -v $file ${classpathDir}/${file}
}

##############################################################################################
# Add IDE JAR
##############################################################################################

addJar $ideUrl ide-${ideVersion}.jar "===== Adding IDE JAR ====="
#echo "===== Adding IDE JAR ====="
#cd $cacheDir
#if [ -f ide-${ideVersion}.jar ]; then
#    echo "Found ide-${ideVersion}.jar in cache"
#else
#    wget $ideUrl -O ide-${ideVersion}.jar
#fi
#
#cp -v ide-${ideVersion}.jar ${classpathDir}/ide-${ideVersion}.jar

##############################################################################################
# Add DevTools Jar
##############################################################################################

addJar $devtoolsUrl spring-boot-devtools-${devtoolsVersion}.jar "===== Adding DevTools JAR ====="
#echo "===== Adding DevTools JAR ====="
#cd $cacheDir
#if [ -f spring-boot-devtools-${devtoolsVersion}.jar ]; then
#    echo "Found spring-boot-devtools.jar in cache"
#else
#    wget $devtoolsUrl -O spring-boot-devtools-${devtoolsVersion}.jar
#fi
#
#cp -v spring-boot-devtools-${devtoolsVersion}.jar ${classpathDir}/spring-boot-devtools-${devtoolsVersion}.jar

##############################################################################################
# Add Collections Jar
##############################################################################################

addJar $devtoolsUrl commons-collections-${collectionsVersion}.jar "===== Adding Collections JAR ====="
#echo "===== Adding Collections JAR ====="
#cd $cacheDir
#if [ -f commons-collections-${collectionsVersion}.jar ]; then
#    echo "Found spring-boot-devtools.jar in cache"
#else
#    wget $devtoolsUrl -O commons-collections-${collectionsVersion}.jar
#fi
#
#cp -v commons-collections-${collectionsVersion}.jar ${classpathDir}/commons-collections-${collectionsVersion}.jar

##############################################################################################
# Add Zuul Jar
##############################################################################################

#echo "===== Adding Zuul JAR ====="
#cd $cacheDir
#if [ -f zuul-core-${zuulVersion}.jar ]; then
#    echo "Found zuul-core-${zuulVersion}.jar in cache"
#else
#    wget $devtoolsUrl -O zuul-core-${zuulVersion}.jar
#fi
#
#cp -v zuul-core-${zuulVersion}.jar ${classpathDir}/zuul-core-${zuulVersion}.jar
