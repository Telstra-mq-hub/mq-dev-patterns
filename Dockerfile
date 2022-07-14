# multistage Dockerfile
# first stage does the maven build
# second stage creates the runtime image
###  stage 1 ###
FROM adoptopenjdk/maven-openjdk11 as builder

WORKDIR /workspace/app

COPY JMS .

RUN mvn clean package

### stage 2  ###


FROM registry.access.redhat.com/ubi8/ubi:8.4

RUN dnf install -y java-11-openjdk.x86_64

COPY --from=builder /workspace/app/target/mq-dev-patterns-0.1.0.jar ./tmp/app.jar
COPY env.json.tmpl ./tmp
COPY runTest.sh ./tmp

EXPOSE 8080/tcp
USER 1001

CMD ["sh", "./tmp/runTest.sh"]