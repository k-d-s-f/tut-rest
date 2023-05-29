FROM eclipse-temurin:17-jre-alpine

# RUN addgroup -S 100 && adduser -S 100 -G 100
# RUN touch /var/log/spring.log
# RUN chown 100:100 /var/log/spring.log
# USER rest

EXPOSE 8080
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar", "--debug"]
