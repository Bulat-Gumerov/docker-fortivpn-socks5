#!/bin/sh
set -e -o pipefail
# Ensure the ppp device exists
[ -c /dev/ppp ] || su-exec root mknod /dev/ppp c 108 0
/usr/bin/glider -listen :8443 &
echo "http/socks5 proxy server: $(hostname -i):8443"
exec "$@"
