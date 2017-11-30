FROM ubuntu:16.04

# Install some needed packages
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    apt-transport-https apt-utils \
    ca-certificates curl wget git vim \
    build-essential \
    libpng12-0 \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#Install Docker:
RUN curl -sSL https://get.docker.com/ | sh

#Install Node.js:
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get -y --no-install-recommends install nodejs \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#Install Yarn:
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get -y --no-install-recommends install yarn \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#Download and install Go 1.9 for Linux:
RUN wget https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.9.linux-amd64.tar.gz \
    && rm -f go1.9.linux-amd64.tar.gz

#Set up your Go workspace
RUN mkdir -p ~/go \
    && echo "export GOPATH=$HOME/go" > ~/.bashrc \
    && echo "export PATH=$PATH:$GOPATH/bin" >> ~/.bashrc \
    && echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc \
    && echo "ulimit -n 8096" >> ~/.bashrc \
    && . ~/.bashrc

WORKDIR /root/go/src/github.com/mattermost/mattermost-server
EXPOSE 8065

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
CMD ["/bin/bash"]