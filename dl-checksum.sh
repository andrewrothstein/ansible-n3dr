#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/030/n3dr/releases/download

dl()
{
    local ver=$1
    local os=$2
    local url=$MIRROR/$ver/n3dr-${os}-latest.sha512.txt

    printf "    # %s\n" $url
    printf "    %s: sha512:%s\n" $os $(curl -sSL $url | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver ubuntu
    dl $ver macos
    dl $ver windows
}

dl_ver ${1:-7.3.3}
