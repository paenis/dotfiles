#!/usr/bin/env bash
scrot -e 'oxipng -o0 --strip safe $f && xclip -selection clipboard -t image/png -i $f && oxipng -ao3 --strip safe $f && mv $f $$HOME/Pictures/screenshots'
