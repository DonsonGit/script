#!/bin/bash

amixer -qM set Master 5%- umute
bash ./dwm-status-refresh.sh
