#!/bin/bash -ueE

sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update -qq
sudo apt-get install -qq ghc-7.10.2 cabal-install-1.22 git gvfs-bin

sudo ln -s /opt/ghc/7.10.2/bin/* /usr/local/bin/
sudo ln -s /opt/cabal/1.22/bin/* /usr/local/bin/

if [[ $PATH != */usr/local/bin/* ]]; then
    export PATH="/usr/local/bin/:$PATH"
fi

cabal update
cabal install happy hlint stylish-haskell ghc-mod

sudo ln -s ~/.cabal/bin/* /usr/local/bin/

wget -O atom.deb https://atom.io/download/deb
sudo dpkg -i atom.deb
rm atom.deb
apm update
apm install autocomplete-haskell haskell-ghc-mod ide-haskell language-haskell
apm install atom-material-syntax atom-material-ui minimap
