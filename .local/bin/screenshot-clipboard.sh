#!/usr/bin/env bash
scrot -e 'oxipng -sao1 $f && xclip -selection clipboard -t image/png -i $f && oxipng -sao5 $f && mv $f $$HOME/Pictures/screenshots'
