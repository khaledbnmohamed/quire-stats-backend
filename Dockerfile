FROM ruby:2.7.1

ARG APP_USER_ID

ENV PROJECT_DIRECTORY    quire_backend
ENV APP_USER             quire_backend
ENV USER_HOME_DIRECTORY  /home/quire_backend
ENV APP_PATH             ${USER_HOME_DIRECTORY}/${PROJECT_DIRECTORY}
ENV BUNDLED_GEMS_PATH    /bundle
ENV BUNDLE_PATH          ${BUNDLED_GEMS_PATH}
ENV BUNDLE_APP_CONFIG    ${BUNDLED_GEMS_PATH}
ENV BUNDLE_BIN           ${BUNDLED_GEMS_PATH}/bin
ENV GEM_HOME             ${BUNDLED_GEMS_PATH}
ENV PATH ${BUNDLE_BIN}:${PATH}
ENV RUBYGEMS_VERSION     ${RUBYGEMS_VERSION}
ENV DEBIAN_FRONTEND noninteractive
ENV NODE_MODULES_DIR          ${APP_PATH}/node_modules
ENV CACHE_DIR                 ${APP_PATH}/tmp/cache
ENV PACKS_DIR                 ${APP_PATH}/public/packs

RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends apt-utils

RUN apt-get install -y git build-essential qt5-qmake g++ qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x nodejs screen libssl-dev libreadline-dev zlib1g-dev wget xfonts-75dpi locales xfonts-base

RUN apt-get install -y locales-all

WORKDIR /tmp

# Add NodeJs Support "https://github.com/nodesource/distributions"
ENV NODEJS_VERSION 10
ENV NODEJS_SETUP_SCRIPT_URL "https://deb.nodesource.com/setup_${NODEJS_VERSION}.x"

RUN wget -q -O - ${NODEJS_SETUP_SCRIPT_URL} | /bin/bash -s -  && \
    apt-get install -yyq nodejs

#Installing yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y yarn

RUN useradd -md ${USER_HOME_DIRECTORY} -u ${APP_USER_ID} -s /bin/bash ${APP_USER} && \
    mkdir -p ${APP_PATH} ${BUNDLED_GEMS_PATH} ${NODE_MODULES_DIR} ${CACHE_DIR} ${PACKS_DIR} && \
    chown -R ${APP_USER}:${APP_USER} ${APP_PATH} ${BUNDLED_GEMS_PATH} ${NODE_MODULES_DIR} ${CACHE_DIR} ${PACKS_DIR}

RUN ["apt-get", "install", "-y", "vim"]

# Copy entrypoint to docker home directory
WORKDIR ${USER_HOME_DIRECTORY}

RUN apt install -y postgresql postgresql-contrib

#Enable Git completion (pressing tab key)
RUN echo "source /usr/share/bash-completion/completions/git" >> ${USER_HOME_DIRECTORY}/.bashrc

#Enable bash coloring
RUN sed -i '/^#.*force_color_prompt=yes.*/s/^#//g' ${USER_HOME_DIRECTORY}/.bashrc

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh

USER ${APP_USER}

WORKDIR ${APP_PATH}

# Left for debugging
# CMD while true ; do sleep 1 ; done
