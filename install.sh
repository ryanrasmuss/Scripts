#!/bin/bash

# Author: Ryan Rasmuss
# For: ECS160 Winter 2017

# 0 means no problem, 1 is problem 
INSTALLED_DEPS=0

MAC_PACKAGES="fluid-synth
gtk+3
libsndfile
portaudio
git
"

FEDORA_PACKAGES="fluidsynth-devel
portaudio-devel
libsndfile-devel
gtk3-devel
git
"
UBUNTU_PACKAGES="libgtk-3-dev
libsndfile-dev
libfluidsynth-dev
portaudio19-dev
git
"

echo "Installing thegame"
echo "If Linux: run as root"
echo "If MAC: DO NOT run as root"

if [[ "$OSTYPE" == "linux"* ]]; then
    # install linux deps
    echo "$OSTYPE detected.."
    FLAVOR=`lsb_release -a | awk '{ if($1 == "Distributor") print $3}'`
    if [[ "$FLAVOR" == "Fedora" ]]; then
        echo "Installing $FLAVOR dependencies.."

        for pkg in $FEDORA_PACKAGES
        do
            dnf install $pkg
            if [ $? == 1 ]; then
                # failed to install
                INSTALLED_DEPS=1
                break
            fi
        done
    fi
    if [[ "$FLAVOR" == "Ubuntu"* ]]; then
        echo "Installing $FLAVOR dependencies.. "

        for pkg in $UBUNTU_PACKAGES
        do
            apt-get install $pkg
            if [ $? == 1 ]; then
                INSTALLED_DEPS=1
                break
            fi
        done
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # install mac deps
    echo "$OSTYPE detected.."
    echo "Installing dependencies (you will need Homebrew).."

    for pkg in $MAC_PACKAGES
    do
        brew search $pkg
        if [ $? == 1 ]; then
            # does not have package
            brew install $pkg
            if [ $? == 1 ]; then
                # failed to install
                INSTALLED_DEPS=1
                break
            fi
        fi
    done

else
    echo "Can't detect operating system: $OSTYPE"
    INSTALLED_DEPS=1
fi

if [[ $INSTALLED_DEPS == 0 ]]; then
    git clone https://github.com/UCDClassNitta/ECS160Linux.git
else
    echo "Could not install dependencies.."
    echo "Remember to run as root!"
    echo "If you are a MAC please get Homebrew"
fi