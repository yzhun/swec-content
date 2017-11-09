# Apply next fixes
* "ALPN callback dropped: SPDY and HTTP/2 are disabled. Is alpn-boot on the boot class path?"
  * Get your Java version ```java -version```
  * Find corresponding alpn boot library ```https://www.eclipse.org/jetty/documentation/9.4.x/alpn-chapter.html#alpn-versions```
  * Download it from ```http://central.maven.org/maven2/org/mortbay/jetty/alpn/alpn-boot/``` and store in ```/usr/lib/jvm```
  * Modify property ```JAVA_ARGS``` in ```/etc/default/jenkins``` adding ```-Xbootclasspath/p:/usr/lib/jvm/alpn-boot-8.1.11.v20170118.jar```
  * Restart Jenkins ```systemctl stop jenkins && systemctl start jenkins```
   
# Jenkins-Github-SonarQube
* Install "GitHub Pull Request Builder", "SonarQube Scanner for Jenkins" and "Sonar Quality Gates Plugin" Jenkins plugins
* Configure "SonarQube servers" instance
* Configure "SonarQube Scanner"
 ```
 SonarQube Scanner 3.0.3
 https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778.zip
 sonar-scanner-3.0.3.778
 ```
* Create Github access token with repo, admin:repo_hook
* Configure "GitHub Pull Request Builder" & "GitHub" to use access token
* Create new pipeline job, using cidd/Jenkinsfile
 ```
 Git repo Refspec:
  +refs/heads/*:refs/remotes/origin/* +refs/pull/*:refs/remotes/origin/pr/*
 Add two job parameters:
  GITHUB_ACCESS_TOKEN
  SONARQUBE_ACCESS_TOKEN
  SERVICE_PORT=8182
 ```
* Check & configure "GitHub Pull Request Builder" & "GitHub hook trigger for GITScm polling"


