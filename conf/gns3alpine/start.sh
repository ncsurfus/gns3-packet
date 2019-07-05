#!/bin/sh
dockerd --storage-driver=vfs --data-root=/data/docker/ &
exec tini -- gns3server -A --config /config.ini