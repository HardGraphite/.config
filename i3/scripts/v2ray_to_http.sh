#!/bin/bash

PRIVOXY_PORT=8118

start-r() {
    systemctl start privoxy
}

stop-r() {
    systemctl stop privoxy
}

init-r() {
    echo '* execute this on your shell:'
    echo export http_proxy="http://127.0.0.1:${PRIVOXY_PORT}"
    echo export https_proxy="http://127.0.0.1:${PRIVOXY_PORT}"
}

deinit-r() {
    echo '* execute this on your shell:'
    echo export http_proxy=
    echo export https_proxy=
}

for cmd in $@; do
    ${cmd}-r
done

