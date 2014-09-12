
FROM t10471/haskell-base:latest

MAINTAINER t10471 <t104711202@gmail.com>

RUN cabal update
RUN cabal install pandoc
RUN cabal install haddock
RUN cabal install hoogle
RUN cabal install ghc-mod

RUN /root/.cabal/bin/hoogle data


