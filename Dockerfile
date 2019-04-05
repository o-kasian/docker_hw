FROM maven:3-jdk-8 as builder

WORKDIR /sources/app/
COPY . .
RUN mvn clean install

FROM openjdk:8-jre-alpine
COPY --from=builder /sources/app/target/*.jar /opt/app/app.jar

WORKDIR /opt/app
CMD ["java", "-jar", "app.jar"]