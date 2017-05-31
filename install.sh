#!/bin/bash

# Author: Ryan Rasmuss
# For: ECS160 Winter 2017

# OLD: DO NOT USE

# 0 means no problem, 1 is problem 
INSTALLED_DEPS=0

# Text sugar [bold output]
bold=$(tput bold)

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
echo "${bold}Installing thegame dependencies"
echo "${bold}If Linux: run as root"
echo "${bold}If MAC: DO NOT run as root"

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
    elif [[ "$FLAVOR" == "Ubuntu"* ]]; then
        echo "Installing $FLAVOR dependencies.. "

        for pkg in $UBUNTU_PACKAGES
        do
            apt-get install $pkg
            if [ $? == 1 ]; then
                # failed to install
                INSTALLED_DEPS=1
                break
            fi
        done
    else
        echo "Unsupported $FLAVOR"
        INSTALLED_DEPS=1
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
    echo "Unsupported OS: $OSTYPE"
    INSTALLED_DEPS=1
fi

if [[ $INSTALLED_DEPS == 0 ]]; then
    echo "${bold}Dependencies successfully installed✓"

else
    echo "Could not install dependencies.."
    echo "Remember to run as root!"
    echo "If you are a MAC please get Homebrew"
fi
