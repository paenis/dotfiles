#!/usr/bin/env bash
scrot -s -f -e 'xclip -selection clipboard -t image/png -i $f && rm $f'
