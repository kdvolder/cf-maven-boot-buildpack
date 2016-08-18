echo "Adding extra JARS on the classpath"
appDir=$1
cacheDir=$2
classpathDir=${appDir}/classpath/BOOT-INF/lib

ideVersion=0.0.3
devtoolsVersion=1.4.0.RELEASE
collectionsVersion=3.2.2
zuulVersion=1.1.0

ideUrl=http://aboyko-ide-jar-server.cfapps.io/ide/ide-${ideVersion}.jar
ideDependenciesUrl=http://aboyko-ide-jar-server.cfapps.io/ide/ide-dependencies.tar.gz
devtoolsUrl=http://central.maven.org/maven2/org/springframework/boot/spring-boot-devtools/${devtoolsVersion}/spring-boot-devtools-${devtoolsVersion}.jar
collectionsUrl=http://central.maven.org/maven2/commons-collections/commons-collections/${collectionsVersion}/commons-collections-${collectionsVersion}.jar
zuulUrl=http://central.maven.org/maven2/com/netflix/zuul/zuul-core/${zuulVersion}/zuul-core-${zuulVersion}.jar

addJar() {
    local url=$1
    local file=$2
    local message=$3
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
# Add Ide Dependencies Jars
##############################################################################################

echo "===== Adding IDE Dependencies JARs ====="
cd $cacheDir
if [ -f ide-dependecies.tar.gz ]; then
    echo "Found IDE dependencies in cache"
else
    wget $ideDependenciesUrl -O ide-dependecies.tar.gz
fi

cd ${classpathDir}
tar xzf ${cacheDir}/ide-dependecies.tar.gz

##############################################################################################
# Show contents of the classapth
##############################################################################################
cd ${classpathDir}
ls
