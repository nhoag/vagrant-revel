#!/bin/bash

set -e
set -x

BRO=/home/vagrant
BROCODE=$BRO/gocode
PLATFORM='unknown'
UNAMESTR=`uname`
ARCH="$(uname -m)"

function set_gopath() {
  mkdir $BROCODE
  export GOPATH=$BROCODE
  echo export GOPATH=$GOPATH >> $BRO/.bash_profile
}

function aptify() {
  sudo apt-get -qq update
  sudo apt-get -qq install -y curl git mercurial vim
}

function build_go() {
  local DLLOC=/tmp
  local VERSION=1.3.3
  local GOSRC='https://storage.googleapis.com/golang'
  local GOARCHIVE="go${VERSION}.${PLATFORM}-${ARCH_TYPE}.tar.gz"
  curl -s -o "${DLLOC}/${GOARCHIVE}" "${GOSRC}/${GOARCHIVE}"
  sudo tar -C /usr/local -xzf "${DLLOC}/${GOARCHIVE}"
  echo export PATH=$PATH:/usr/local/go/bin >> $BRO/.bash_profile
}

function install_revel() {
  local GOLOCAL=/usr/local
  local GOBIN=$GOLOCAL/go/bin
  $GOBIN/go get github.com/revel/revel
  $GOBIN/go get github.com/revel/cmd/revel
  export PATH="$PATH:$GOPATH/bin"
  echo 'export PATH="$PATH:$GOPATH/bin"' >> $BRO/.bash_profile
}

function set_perms() {
  sudo chown -R vagrant:vagrant $GOPATH
}

if [[ "$UNAMESTR" == 'Linux' && "$ARCH" -eq 'x86_64' ]]; then
  ARCH_TYPE='amd64'
  PLATFORM='linux'
  if [[ ! -d $BROCODE ]] ; then
    set_gopath
    aptify
    build_go
    install_revel
    set_perms
  fi
fi
