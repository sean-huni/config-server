FROM openjdk:10-jre-slim
RUN mkdir -p /app/config-service/
COPY build/libs/config.jar /app/config-service/config.jar
RUN apt-get update -y
RUN apt-get install -y vim
RUN apt-get install curl -y
RUN apt-get install -y procps
RUN apt-get install htop -y
RUN apt-get update -y
RUN java -version
VOLUME /tmp
RUN bash -c 'touch /app/config-service/config.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/config-service/config.jar"]
EXPOSE 8002
