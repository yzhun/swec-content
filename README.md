# Software Engineering Course

## Install Talan
### Add prerequisites
```
> tln install java,maven,nodejs,docker,docker-compose
```

## Github
* Create personal access token with **repo**, **admin:repo_hook**

## SonarQube
* Up SonarQube instance
```
> cd sonarqube
> ./sonarqube-up.sh -d
```
* Access point **http://\<host-ip-address\>:9000**, user/pass **admin/admin**
* Generate access token
* Install & configure "Github" plugin at Marketplace/Configuration

## Jenkins
### Install
```
> tln install jenkins
```

### Apply fixes (if jenkins logs notifies errors/warnings)
* "ALPN callback dropped: SPDY and HTTP/2 are disabled. Is alpn-boot on the boot class path?"
  * Get your Java version ```java -version```
  * Find corresponding alpn boot library ```https://www.eclipse.org/jetty/documentation/9.4.x/alpn-chapter.html#alpn-versions```
  * Download it from ```http://central.maven.org/maven2/org/mortbay/jetty/alpn/alpn-boot/``` and store in ```/usr/lib/jvm```
  * Modify property ```JAVA_ARGS``` in ```/etc/default/jenkins``` adding ```-Xbootclasspath/p:/usr/lib/jvm/alpn-boot-8.1.11.v20170118.jar```
  * Restart Jenkins ```systemctl stop jenkins && systemctl start jenkins```

### Install plugins
* "GitHub Pull Request Builder"
* "SonarQube Scanner for Jenkins"
* "Sonar Quality Gates Plugin"

### Configure plugins
* Configure "SonarQube servers" instance
* "GitHub" instance
* ? "Quality Gates - Sonarqube"
* "GitHub Pull Request Builder"

### Configure tools
* Configure "SonarQube Scanner"
 ```
Name: "SonarQube Scanner 3.0.3.778"
```


## Create new pipeline job
* "GitHub project" : https://github.com/user/saas-template
* "GitHub Pull Request Builder" \[+\]
  * Add your user into WhiteList
* "GitHub hook trigger for GITScm polling"
* Add job parameters
  * GITHUB_REPOSITORY - https://github.com/user/saas-template.git
  * SONARQUBE_SCANNER - SonarQube Scanner 3.0.3.778
  * GITHUB_ACCESS_TOKEN
  * SONARQUBE_ACCESS_TOKEN
  * NEXUS_REPOSITORY - 
  * SERVICE_PORT - 8182
, using cidd/Jenkinsfile
 ```
 Add job parameters:
  GITHUB_REPOSITORY

 Use git repo Refspec:
  +refs/heads/*:refs/remotes/origin/* +refs/pull/*:refs/remotes/origin/pr/*
 ```
* Check & configure "GitHub Pull Request Builder" & "GitHub hook trigger for GITScm polling"
* Mark master branch as protected
