FROM gradle:8.2.1-jdk17-alpine AS build
WORKDIR /opt/app
COPY . .
RUN gradle build -x test --no-daemon

FROM openjdk:17-jdk-alpine
WORKDIR /opt/app
COPY --from=build /opt/app/build/libs/*.jar /opt/app/spring-boot-application.jar
ENTRYPOINT ["java", "-jar", "/opt/app/spring-boot-application.jar"]