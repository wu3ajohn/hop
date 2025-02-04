set JAVA_HOME=D:\app\jdk-dragonwell-17.0.11.0.12
set JAVA_HOME=D:\app\jdk-ms-17.0.13
set PATH=%JAVA_HOME%\bin;%PATH%

cd /d D:\project\z-opensource\hop

mvn clean install

mvn -rf :hop-core install

mvn -rf :hop-core install -DskipTests


mvn install:install-file -Dfile=D:\var\tmp\commons-validator-1.9.0.jar -DgroupId=commons-validator -DartifactId=commons-validator -Dversion=1.9.0 -Dpackaging=jar


mvn install -rf :hop-engines-beam


cd /cygdrive/d/app/maven/repository
find /cygdrive/d/app/maven/repository -type f -mtime -7 -exec zip -r /cygdrive/d/var/tmp/maven-20250204.zip {} +
find . -type f -mtime -7 -exec zip -r /cygdrive/d/var/tmp/maven-20250204.zip {} +





$recentFiles = Get-ChildItem -Path "D:\app\maven\" -Recurse | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) }
Compress-Archive -Path $recentFiles.FullName -DestinationPath "D:\var\tmp\maven-20250120.zip"


git checkout -b release/2.11.0
git push --set-upstream origin release/2.11.0


apache/hop:release/2.11.0
git@github.com:wu3ajohn/hop.git


2.12.0-SNAPSHOT ->2.11.0 