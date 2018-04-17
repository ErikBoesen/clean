#!/usr/bin/env bash

function yn {
    read -p "$1 [y/n] " reply
    if [[ $reply =~ ^[Yy] ]]; then
        return 0
    else
        return 1
    fi
}

if [[ $(id -u) -ne 0 ]]; then
    echo "Must be root!"
    exit 1
fi

if yn "Remove musical files (such as GarageBand, Logic loops)?"; then
    rm -rf /Library/Application\ Support/{Logic,GarageBand}
    rm -rf /Applications/GarageBand.app
fi

if yn "Remove Microsoft Silverlight?"; then
    rm -rf /Applications/Microsoft\ Silverlight
fi

if yn "Remove iTunes files?"; then
    rm -rf /Library/iTunes
fi

if yn "Purge factory desktop pictures?"; then
    rm -rf /Library/Desktop\ Pictures
fi

if yn "Remove Photo libraries?"; then
    rm -rf /Users/*/Photos/{Photo\ Booth\ Library,Photos\ Library}
fi

# TODO: Optionally remove McAfee
