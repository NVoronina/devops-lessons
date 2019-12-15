FROM tomcat:8.0

ENV CATALINA_BASE   /usr/local/tomcat
RUN apt-get update
RUN apt-get install -y git default-jdk maven nano net-tools

RUN mkdir /code
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /code
RUN cd /code && mvn package
RUN rm -rf ${CATALINA_BASE}/webapps/*
RUN cp /code/target/hello-1.0.war ${CATALINA_BASE}/webapps

EXPOSE 8080
CMD ["catalina.sh", "run"]