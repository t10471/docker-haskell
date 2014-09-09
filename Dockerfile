FROM darinmorrison/haskell:latest

MAINTAINER t10471 <t104711202@gmail.com>

ENV OPTS_APT        -y --force-yes --no-install-recommends

RUN apt-get update\
 && apt-get install ${OPTS_APT}\
      zlib1g-dev

RUN cabal install pandoc

RUN mkdir ~/workspace
VOLUME /home/haskell/workspace
