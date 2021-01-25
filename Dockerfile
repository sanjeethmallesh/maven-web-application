FROM tomcat:7-jdk8-corretto
COPY target/maven-web-application.war /opt/tomcat/webapps/