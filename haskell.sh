#!/bin/bash -ueE

curl -sSL https://get.haskellstack.org/ | sh

stack update
stack install hlint stylish-haskell ghc-mod

wget -O atom.deb https://atom.io/download/deb
sudo dpkg -i atom.deb
rm atom.deb
apm update
apm install autocomplete-haskell haskell-ghc-mod ide-haskell ide-haskell-hoogle language-haskell
apm install minimap
