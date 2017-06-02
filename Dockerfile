FROM centos:centos7

ARG bluemixcli_version=0.5.4_amd64
ARG kubectl_version=v1.6.3

ENV BLUEMIXCLI_VERSION=$bluemixcli_version KUBECTL_VERSION=$kubectl_version

ADD \
  http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/Bluemix_CLI_$BLUEMIXCLI_VERSION.tar.gz \
  /tmp/Bluemix_CLI.tar.gz

ADD \
  https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl \
  /usr/local/bin/kubectl

RUN \
  cd /tmp \
  && tar xvf Bluemix_CLI.tar.gz \
  && cd Bluemix_CLI && sh ./install_bluemix_cli \
  && rm -rf /tmp/Bluemix_CLI* \
  && chmod a+x /usr/local/bin/kubectl

ENV BLUEMIX_API_KEY=""
