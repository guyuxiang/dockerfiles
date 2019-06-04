FROM continuumio/anaconda3:latest
# FROM ubuntu:latest

# install code-server
ENV CSVERSION=1.1119-vsc1.33.1
ENV CODESERVER=https://github.com/codercom/code-server/releases/download/${CSVERSION}/code-server${CSVERSION}-linux-x64.tar.gz
ADD $CODESERVER code-server.tar
RUN mkdir -p code-server \
    && tar -xf code-server.tar -C code-server --strip-components 1 \
    && cp code-server/code-server /usr/local/bin \
    && rm -rf code-server* \
	&& apt-get update \
	&& apt-get install -y locales \
	&& locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
# EXPOSE 8443

# install apt packages
RUN apt-get -y install \
	--no-install-recommends \
	git \
	apt-utils \
	openssh-server \
	vim \
	sudo \
	xauth \
	wget \
	openssl \
	net-tools \ 
	&& apt-get update \
	&& apt-get -y upgrade

# install python packages
RUN pip install mkdocs \
	&& pip install thefuck

# add devg nonroot user 'devg'
# if using root, Github will complain about the ssh key too open. And chmod inside of docker do not work.
ENV USERNAME=devg GID=1001 UID=1001
RUN groupadd -g ${GID} ${USERNAME} && \
    useradd -l -r -u ${UID} -g ${USERNAME} ${USERNAME}
USER ${USERNAME}
WORKDIR /home/${USERNAME}

ENTRYPOINT [ "code-server" ]