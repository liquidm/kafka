FROM ubuntu:bionic

RUN apt-get update \
      && apt-get install -y openjdk-8-jdk-headless \
                            git \
                            curl \
                            wget \
      && apt-get clean


WORKDIR /tmp/kafka

COPY . .

RUN update-java-alternatives  -s java-1.8.0-openjdk-amd64 \
      && ./gradlew clean releaseTarGz

CMD ./cmd.sh
