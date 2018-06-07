FROM openjdk:8
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

ARG VERSION=5.8.2

RUN apt-get update && apt-get install -y curl unzip \
 && curl -A "Docker" -o bftools.zip https://downloads.openmicroscopy.org/bio-formats/$VERSION/artifacts/bftools.zip \
 && unzip -d /opt bftools.zip && rm bftools.zip \
 && chmod a+rx /opt/bftools/* \
 && rm -rf /var/lib/apt/lists/*

RUN useradd -m bf

ENV PATH="${PATH}:/opt/bftools"
USER bf

ENV HOME /home/bf
WORKDIR /opt/bftools

ENTRYPOINT ["bash"]
