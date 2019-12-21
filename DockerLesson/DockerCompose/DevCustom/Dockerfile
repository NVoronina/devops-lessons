FROM tomcat:8.0

RUN apt-get update
RUN apt-get install -y git default-jdk maven nano net-tools

RUN mkdir /code && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /code && cd /code && mvn package && rm -rf ${CATALINA_BASE}/webapps/* && cp /code/target/hello-1.0.war ${CATALINA_BASE}/webapps

EXPOSE 8080
CMD ["catalina.sh", "run"]