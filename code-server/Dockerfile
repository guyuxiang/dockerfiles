FROM ubuntu:18.10

ENV CSVERSION=1.32.0-245
ENV CODESERVER=https://github.com/codercom/code-server/releases/download/${CSVERSION}/code-server-${CSVERSION}-linux-x64.tar.gz
ADD $CODESERVER code-server.tar
RUN mkdir -p code-server \
    && tar -xf code-server.tar -C code-server --strip-components 1 \
    && cp code-server/code-server /usr/local/bin \
    && rm -rf code-server*

EXPOSE 8443
RUN apt-get update && apt-get install -y \
	openssl \
	net-tools
RUN apt-get install -y locales && \
	locale-gen en_US.UTF-8
# We unfortunately cannot use update-locale because docker will not use the env variables
# configured in /etc/default/locale so we need to set it manually.
ENV LANG=en_US.UTF-8

RUN apt-get update \
	&& apt-get -y upgrade \
	&& apt-get -y install \
	--no-install-recommends \
	git \
	apt-utils \
	openssh-server \
	xauth

WORKDIR /root