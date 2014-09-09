FROM darinmorrison/haskell:latest

MAINTAINER t10471 <t104711202@gmail.com>

RUN apt-get install zlib1g-dev
RUN cabal install pandoc
RUN mkdir ~/workspace
VOLUME /home/haskell/workspace
