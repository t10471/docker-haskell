
FROM t10471/haskell-base:latest

MAINTAINER t10471 <t104711202@gmail.com>

RUN cabal update
#RUN cabal install yesod-bin persistent-mysql --max-backjumps=-1 --reorder-goals
RUN cabal install pandoc
RUN cabal install haddock
RUN cabal install hoogle
# RUN cabal install ghc-mod
# RUN cabal install lens
# RUN /root/.cabal/bin/hoogle data

RUN wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | sudo apt-key add -
RUN echo 'deb http://download.fpcomplete.com/ubuntu/trusty stable main'|sudo tee /etc/apt/sources.list.d/fpco.list
RUN apt-get update && sudo apt-get install stack -y
# RUN stack install yesod-bin cabal-install --install-ghc

ADD init.sh /root/
ADD ghci.conf /root/.ghc/
