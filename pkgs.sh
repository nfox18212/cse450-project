#!/bin/bash
set -xe

apt update
DEBIAN_FRONTEND=noninteractive apt install -y \
    curl \
    dbus-x11 \
    git \
    gtkwave \
    iverilog \
    jq \
    python3-pip \
    universal-ctags \
    verilator \
    wget
pip3 install \
    cocotb \
    cocotb-test \
    flake8 \
    isort \
    pytest \
    yapf

# Verible
ARCH=$(uname -m)
if &#91;&#91; $ARCH == &quot;aarch64&quot; ]]; then
    ARCH=&quot;arm64&quot;
fi
DIST_ID=$(grep DISTRIB_ID /etc/lsb-release | cut -d'=' -f2)
DIST_RELEASE=$(grep RELEASE /etc/lsb-release | cut -d'=' -f2)
DIST_CODENAME=$(grep CODENAME /etc/lsb-release | cut -d'=' -f2)
VERIBLE_RELEASE=$(curl -s -X GET https://api.github.com/repos/chipsalliance/verible/releases/latest | jq -r '.tag_name')
VERIBLE_TAR=verible-$VERIBLE_RELEASE-linux-static-$ARCH.tar.gz
if &#91;&#91; ! -f $VERIBLE_TAR ]]; then
    wget https://github.com/chipsalliance/verible/releases/download/$VERIBLE_RELEASE/$VERIBLE_TAR
fi
if &#91;&#91; ! -f &quot;/usr/local/bin/verible-verilog-format&quot; ]]; then
    tar -C /usr/local --strip-components 1 -xf $VERIBLE_TAR
fi
rm $VERIBLE_TAR