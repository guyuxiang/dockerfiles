FROM ubuntu:latest

ENV CODEDEB=https://go.microsoft.com/fwlink/?LinkID=760868
ADD $CODEDEB code.deb

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install \
    --no-install-recommends \
    ./code.deb \
    apt-utils \
    libgtk2.0-0 \
    libx11-xcb1 \
    libxtst6 \
    libxss1 \
    libasound2 \
    dbus \
    libgl1 \
    git \
    openssh-server \
    xauth \
    ttf-ubuntu-font-family \
    sudo \
    && rm -rf code.deb \
    && rm -rf /var/lib/apt/lists/*
 
ENV USERNAME=devg GID=1001 UID=1001
ENV VSETC=/etc/.vscode
ENV VS_CODE_USER=${VSETC}/${USERNAME}

RUN groupadd -g ${GID} ${USERNAME} && \
    useradd -l -r -u ${UID} -g ${USERNAME} ${USERNAME} \
    && mkdir -p ${VS_CODE_USER}/User \
    && mkdir -p ${VS_CODE_USER}/extensions \
    && echo "{ \
            \"window.titleBarStyle\": \"native\", \
            \"terminal.integrated.shell.linux\": \"/bin/bash\" \
            }" > ${VS_CODE_USER}/User/settings.json \
    && /bin/bash -c 'service dbus start' \
    && /bin/bash -c 'code --user-data-dir=${VS_CODE_USER} --extensions-dir ${VS_CODE_USER}/extensions --install-extension streetsidesoftware.code-spell-checker' \
    && /bin/bash -c 'code --user-data-dir=${VS_CODE_USER} --extensions-dir ${VS_CODE_USER}/extensions --install-extension github.vscode-pull-request-github' \
    && /bin/bash -c 'code --user-data-dir=${VS_CODE_USER} --extensions-dir ${VS_CODE_USER}/extensions --install-extension ms-python.python' \
    && /bin/bash -c 'code --user-data-dir=${VS_CODE_USER} --extensions-dir ${VS_CODE_USER}/extensions --install-extension juanblanco.solidity' \
    && /bin/bash -c 'code --user-data-dir=${VS_CODE_USER} --extensions-dir ${VS_CODE_USER}/extensions --install-extension hookyqr.beautify' \
    && /bin/bash -c 'code --user-data-dir=${VS_CODE_USER} --extensions-dir ${VS_CODE_USER}/extensions --install-extension davidanson.vscode-markdownlint' \
    && /bin/bash -c 'code --user-data-dir=${VS_CODE_USER} --extensions-dir ${VS_CODE_USER}/extensions --install-extension yzhang.markdown-all-in-one' \
    && /bin/bash -c 'code --user-data-dir=${VS_CODE_USER} --extensions-dir ${VS_CODE_USER}/extensions --install-extension dbaeumer.vscode-eslint' \
    && /bin/bash -c 'code --user-data-dir=${VS_CODE_USER} --extensions-dir ${VS_CODE_USER}/extensions --install-extension eamodio.gitlens' \
    && /bin/bash -c 'code --user-data-dir=${VS_CODE_USER} --extensions-dir ${VS_CODE_USER}/extensions --install-extension pkief.material-icon-theme' \
    && /bin/bash -c 'code --user-data-dir=${VS_CODE_USER} --extensions-dir ${VS_CODE_USER}/extensions --install-extension msjsdiag.debugger-for-chrome' \
    && chown -R ${USERNAME}:${USERNAME} ${VS_CODE_USER}

USER ${USERNAME}
WORKDIR /home/${USERNAME}