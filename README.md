# Software Engineering Course

## Prerequisites
* Allocate Ubuntu 16.04 VM
* Install [helper - talan cli](https://github.com/project-talan/tln-cli)
* Install prerequisites
  ```
  sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/swe-course/swec-content/master/prereq.sh)"
  ```
* Clone repository
  ```
  mkdir projects; pushd projects; git clone https://github.com/swe-course/swec-content.git; popd
  ```

## Nexus
* Up Nexus instance
  ```
  > cd ~/projects/swec-content/nexus
  > ./nexus-up.sh -d
  ```
* Access point **http://\<host-ip-address\>:8081**, user/pass **admin/admin123**
* Create new maven2 hosted repository, name: **saas-template**
  ![](https://raw.githubusercontent.com/swe-course/swec-content/master/imgs/nexus-maven-repo.png)

## Github
* Create personal access token with **repo**, **admin:repo_hook**
  ![](https://raw.githubusercontent.com/swe-course/swec-content/master/imgs/github-token.png)


## SonarQube
* Up SonarQube instance
  ```
  > cd ~/projects/swec-content/sonarqube
  > ./sonarqube-up.sh -d
  ```
* Access point **http://\<host-ip-address\>:9000**, user/pass **admin/admin**
* Install "Github" plugin and restart Sonar, using hint at the top of the page
  ![](https://raw.githubusercontent.com/swe-course/swec-content/master/imgs/sonar-github.png)
* Generate access token
  ![](https://raw.githubusercontent.com/swe-course/swec-content/master/imgs/sonar-token.png)


## Jenkins
* Install
  ```
  > tln install jenkins
  ```
* Access point **http://\<host-ip-address\>:8080**
* Apply fix(es) for **"ALPN callback dropped: SPDY and HTTP/2 are disabled. Is alpn-boot on the boot class path?"**
  * Check your Java version 
    ```bash
    > java -version
    ```

    > openjdk version "1.8.0_171"
    > OpenJDK Runtime Environment (build 1.8.0_171-8u171-b11-0ubuntu0.16.04.1-b11)
    > OpenJDK 64-Bit Server VM (build 25.171-b11, mixed mode)
    
  * Find corresponding alpn boot library
  
    ```
    https://www.eclipse.org/jetty/documentation/9.4.x/alpn-chapter.html#alpn-versions
    ```
    | OpenJDK version | ALPN version |
    | --- | --- |
    | 1.8.0u171 | 8.1.12.v20180117 |
    
  * Copy link to the corresponding ALPN jar from 'ALPN version' folder
    ```
    http://central.maven.org/maven2/org/mortbay/jetty/alpn/alpn-boot/
    ```
    > http://central.maven.org/maven2/org/mortbay/jetty/alpn/alpn-boot/8.1.12.v20180117/alpn-boot-8.1.12.v20180117.jar
    
  * Goto JVM folder
    ```
    > cd /usr/lib/jvm
    ```
  * Download jar file
    ```
    > wget http://central.maven.org/maven2/org/mortbay/jetty/alpn/alpn-boot/8.1.12.v20180117/alpn-boot-8.1.12.v20180117.jar
    ```
  * Goto folder
    ```
    > cd /etc/default
    ```
  * Open for editing **jenkins** file
  * Modify property **JAVA_ARGS** variable
    from
    ```
    JAVA_ARGS="-Djava.awt.headless=true"
    ```
    too
    ```
    JAVA_ARGS="-Djava.awt.headless=true -Xbootclasspath/p:/usr/lib/jvm/alpn-boot-8.1.12.v20180117.jar -Dhudson.DNSMultiCast.disabled=true"
    ```
  * Restart Jenkins
    ```
    systemctl stop jenkins && systemctl start jenkins
    ```
* Install plugins
  ```
  > cd ~/projects/swec-content/jenkins
  > ./install-plugins.sh
  ```

### Configure plugins
Goto Manage **Manage Jenkins/Configure System**
* Configure "SonarQube servers" instance, name **SonarQube**
  ![](https://raw.githubusercontent.com/swe-course/swec-content/master/imgs/jenkins-sonar.png)
* "GitHub" instance + Github access credentials using created token
  ![](https://raw.githubusercontent.com/swe-course/swec-content/master/imgs/jenkins-github.png)
* "GitHub Pull Request Builder"
  ![](https://raw.githubusercontent.com/swe-course/swec-content/master/imgs/jenkins-ghprb.png)

### Configure tools
Goto Manage **Manage Jenkins/Global Tool Configuration**
* Configure "SonarQube Scanner", name - **SonarQube Scanner**
  ![](https://raw.githubusercontent.com/swe-course/swec-content/master/imgs/jenkins-tools-sonar-scanner.png)

## Fork template **https://github.com/swe-course/saas-template**

## Create new 'Pipeline' job
* Specify your fork url
  ![](https://raw.githubusercontent.com/swe-course/swec-content/master/imgs/jenkins-pipeline-repo.png)
* Add job parameters

  | Parameter name | Value |
  | --- | --- |
  | SONARQUBE_SERVER | **SonarQube** |
  | SONARQUBE_SCANNER | **SonarQube Scanner** |
  | SONARQUBE_ACCESS_TOKEN | - |
  | GITHUB_ACCESS_TOKEN | - |
  | NEXUS_HOST | **http://\<host-ip-address\>:8081** |
  | NEXUS_REPO | **saas-template** |
  | NEXUS_USER | **admin** |
  | NEXUS_PASS | **admin123** |
  | SERVICES_GJ_PORT | **8182** |
* Configure "GitHub Pull Request Builder"
  ![](https://raw.githubusercontent.com/swe-course/swec-content/master/imgs/jenkins-pipeline-ghprb.png)
  * Add your user into WhiteList
* "GitHub hook trigger for GITScm polling"  
* Set pipeline definitions
  * Select **Pipeline script from SCM**
  * Select SCM **Git**
  * Set repository url
    ```
    https://github.com/<YOU_ACCOUNT|ORG>/saas-template.git
    ```
  * Use git repo Refspec (**Advanced** button):
    ```
    +refs/heads/*:refs/remotes/origin/* +refs/pull/*:refs/remotes/origin/pr/*
     ```
  * Add additional branch
    ```
    ${sha1}
    ```
  ![](https://raw.githubusercontent.com/swe-course/swec-content/master/imgs/jenkins-pipeline-definition.png)

## Gonfigure branch(es)
* Mark master branch as protected at Repository **Settings**

## Create new 'Multibranch Pipeline' job
* 

