* execute ```./step01-install.sh```

# Jenkins-Github
* Install "GitHub Pull Request Builder", "SonarQube Scanner for Jenkins" and "Sonar Quality Gates Plugin" Jenkins plugins
* Configure Sonar instance and SonarRunner (tools) at Jenkins side
* Create Github access token with repo, admin:repo_hook, admin:org_hook
* Install next plugins: "GitHub Pull Request Builder" & "GitHub" to use access token
* Create new pipeline job, using cidd/Jenkinsfile, +refs/heads/*:refs/remotes/origin/* +refs/pull/*:refs/remotes/origin/pr/*
* Check & configure "GitHub Pull Request Builder" & "GitHub hook trigger for GITScm polling"

# Issues
* "ALPN callback dropped: SPDY and HTTP/2 are disabled. Is alpn-boot on the boot class path?"
  * Get your Java version '''java -version #openjdk version "1.8.0_131"'''
  * Find corresponding alpn boot library '''https://www.eclipse.org/jetty/documentation/9.4.x/alpn-chapter.html#alpn-versions #8.1.11.v20170118'''
  * Download it from '''http://central.maven.org/maven2/org/mortbay/jetty/alpn/alpn-boot/ #/usr/lib/jvm'''
  * Modify '''/etc/default/jenkins''' JAVA_ARGS adding '''-Xbootclasspath/p:/path/to/alpn-boot-8.1.11.v20170118.jar'''
  * Restart Jenkins '''systemctl stop jenkins & systemctl start jenkins'''
