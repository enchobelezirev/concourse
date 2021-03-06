FROM cloudfoundry/cli-ci

LABEL name=xs2ds/oq-cf

ENV VERSION 0.1


RUN mkdir /workspace
RUN ls -a
#Copy test scripts
COPY test_scripts /workspace/test_scripts
COPY test_resources /workspace/test_resources
COPY test_scenarios /workspace/test_scenarios
COPY mta_plugin_linux_amd64 /workspace/mta_plugin_linux_amd64
COPY xs-cli.zip /workspace/xs-cli.zip
COPY docker-java-home /workspace/docker-java-home
# Install Cloud Foundry cli
ADD https://cli.run.pivotal.io/stable?release=linux64-binary&version=6.26.0 /tmp/cf-cli.tgz
RUN mkdir -p /usr/local/bin && \
  tar -xzf /tmp/cf-cli.tgz -C /usr/local/bin && \
  cf --version && \
  rm -fv /tmp/cf-cli.tgz
# Install latest released cf cli MTA plugin

RUN cd /workspace/ && \
    ls -Faltr . && \
    find . -type f && \
    chmod +x mta_plugin_linux_amd64 && \
    cf install-plugin mta_plugin_linux_amd64 -f &&\
    rm -rf mta_plugin_linux_amd64

WORKDIR /workspace

#TODO find another way to assemble test resources
RUN mkdir /workspace/sanity-check
ADD https://github.com/nvvalchev/spring-music/blob/master/mta-assembly/spring-music.mtar?raw=true /workspace/test_resources/sanity-check/sanity-check.mtar
ADD https://github.com/nvvalchev/spring-music/blob/master/config.mtaext?raw=true /workspace/test_resources/sanity-check/
RUN mkdir /workspace/xs
RUN ls -a
RUN unzip ./xs-cli.zip -d /workspace/xs
ENV PATH="$PATH:/workspace/xs/bin"
ENV JAVA_HOME=/workspace/docker-java-home
ENV PATH="$PATH:/workspace/docker-java-home/bin"
ENV HTTPS_PROXY=https://proxy.wdf.sap.corp:8080
ENV HTTP_PROXY=http://proxy.wdf.sap.corp:8080

ENV https_proxy=https://proxy.wdf.sap.corp:8080
ENV http_proxy=https://proxy.wdf.sap.corp:8080
RUN apt-get update && apt-get install -y libxml2-utils

ENTRYPOINT ["/bin/bash"]

