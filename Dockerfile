#Build
FROM gradle:8.1.1-jdk17-alpine AS Build

WORKDIR /opt/app

COPY build.gradle settings.gradle .

COPY src src

RUN gradle bootJar -x test --no-daemon


# Run
FROM openjdk:17-jdk-alpine

RUN \
    apk update && \
    apk upgrade

WORKDIR /opt

COPY --from=Build /opt/app/build/libs/*.jar /opt

RUN \
    adduser -D 10001

USER 10001

ENTRYPOINT ["sh", "-c", "java -jar /opt/*.jar"]