#!/usr/bin/env bash
scrot -e 'oxipng -sao0 $f && xclip -selection clipboard -t image/png -i $f && oxipng -sao3 $f && mv $f $$HOME/Pictures/screenshots'
