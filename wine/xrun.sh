#!/bin/bash -e

function cleanup {
    wineboot -e
    rm -f /tmp/.X*-lock
    rm -rf /root/.cache
}

trap cleanup EXIT

xvfb-run "$@" & wait
