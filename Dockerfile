FROM darinmorrison/haskell:latest

MAINTAINER t10471 <t104711202@gmail.com>

ENV OPTS_APT -y --force-yes --no-install-recommends

RUN apt-get update\
 && apt-get install ${OPTS_APT}\
      zlib1g-dev \
      git \
      build-essential \
      wget

RUN cabal update
RUN cabal install pandoc
RUN cabal install haddock
RUN cabal install hoogle
RUN cabal install ghc-mod

RUN mkdir ~/workspace
VOLUME /root/workspace

RUN touch /root/.ssh/known_hosts
# Add bitbuckets key
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN echo "Host github.com\n\
  User git\n\
  Port 22\n\
  Hostname github.com\n\
  IdentityFile ~/.ssh/id_rsa_github\n\
  TCPKeepAlive yes\n\
  IdentitiesOnly yes\n" >> /root/.ssh/config

ADD dotfiles.sh /root/
RUN curl -L https://gist.github.com/lambdalisue/5911291/raw/install_vim_debian.sh | bash
