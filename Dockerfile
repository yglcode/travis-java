FROM openjdk:8-jre-alpine
ARG tag=latest
COPY target/HelloTravis-$tag.jar ./HelloTravis.jar
ENTRYPOINT ["java", "-cp", "HelloTravis.jar", "code.ygl.App"]
