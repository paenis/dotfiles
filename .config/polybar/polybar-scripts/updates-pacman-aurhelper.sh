#!/bin/sh

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

# if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
if ! updates_aur=$(paru -Qum 2> /dev/null | wc -l); then
# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
# if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
# if ! updates_aur=$(pikaur -Qua 2> /dev/null | wc -l); then
# if ! updates_aur=$(rua upgrade --printonly 2> /dev/null | wc -l); then
    updates_aur=0
fi

updates=$((updates_arch + updates_aur))

if [ "$updates" -gt 0 ]; then
    # echo "$updates"
    e="$updates / "
    if [ "$updates_arch" -gt 0 ]; then
        e="$e${updates_arch} repo"
        if [ "$updates_aur" -gt 0 ]; then
            e="$e + "
        fi
    fi
    if [ "$updates_aur" -gt 0 ]; then
        e="$e${updates_aur} AUR"
    fi
    echo "$e"
else
    echo ""
    # echo 0
fi
