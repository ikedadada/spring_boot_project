FROM eclipse-temurin:21-jdk-alpine

RUN apk update && apk upgrade --no-cache
RUN apk add --no-cache curl tar

RUN curl -O https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/3.2.1/spring-boot-cli-3.2.1-bin.tar.gz
RUN tar -xvf spring-boot-cli-3.2.1-bin.tar.gz && rm spring-boot-cli-3.2.1-bin.tar.gz

ENV USER_ID=1000
ENV GROUP_ID=1000

RUN addgroup -g $GROUP_ID appuser && adduser -u $USER_ID -G appuser -s /bin/sh -D appuser

USER appuser

WORKDIR /app
