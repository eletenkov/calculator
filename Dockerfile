FROM frolvlad/alpine-oraclejre8:slim
COPY target/calculator-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]