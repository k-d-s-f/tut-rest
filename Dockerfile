FROM eclipse-temurin:17-jre-alpine

RUN addgroup -S rest && adduser -S rest -G rest
USER rest

EXPOSE 8080
VOLUME /tmp
ARG JAR_FILE=links/target/links-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]