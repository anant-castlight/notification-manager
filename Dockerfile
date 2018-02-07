FROM ops.artifactory.jiff.ops/jiff/java-build:0.0.1 AS build


ENV APP_PATH /app
RUN mkdir ${APP_PATH}

COPY . .
RUN mvn clean install -DskipTests
RUN cp /home/jiff_user/app/target/notification-manager.jar ${APP_PATH}/app.jar

FROM platform.artifactory.jiff.ops/jiff/hydra-base:0.0.1
