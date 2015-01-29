
FROM t10471/haskell-base:latest

MAINTAINER t10471 <t104711202@gmail.com>

RUN cabal update
RUN cabal install yesod-platform yesod-bin persistent-mysql --max-backjumps=-1 --reorder-goals
RUN cabal install pandoc
RUN cabal install haddock
RUN cabal install hoogle
RUN cabal install ghc-mod
RUN cabal install lens
# RUN /root/.cabal/bin/hoogle data

ADD init.sh /root/
