#!/bin/bash -ueE

sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update -qq
sudo apt-get install -qq ghc-7.10.2 cabal-install-1.22 git

sudo ln -s /opt/ghc/7.10.2/bin/* /usr/local/bin/
sudo ln -s /opt/cabal/1.22/bin/* /usr/local/bin/

cabal update
cabal install happy hlint stylish-haskell

git clone https://github.com/kazu-yamamoto/ghc-mod.git
cd ghc-mod
cabal install

sudo ln -s ~/.cabal/bin/* /usr/local/bin/

wget -O atom.deb https://atom.io/download/deb
sudo dpkg -i atom.deb
rm atom.deb
apm update
apm install autocomplete-hasell haskell-ghc-mod ide-haskell language-haskell
apm install atom-material-syntax atom-material-ui linter-xmllint xml-formatter minimap
