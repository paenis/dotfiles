#!/usr/bin/env bash
scrot -e 'xclip -selection clipboard -t image/png -i $f && rm $f'
