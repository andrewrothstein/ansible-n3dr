#!/usr/bin/env sh
VER=${1:-3.3.2}
DIR=~/Downloads
MIRROR=https://github.com/030/n3dr/releases/download/${VER}

dl()
{
    local os=$1
    local url=$MIRROR/n3dr-${os}.sha512.txt

    printf "      # %s\n" $url
    printf "      %s: sha512:%s\n" $os $(curl -sSL $url | awk '{print $1}')
}

printf "  '%s':\n" $VER
dl linux
dl osx
dl windows

