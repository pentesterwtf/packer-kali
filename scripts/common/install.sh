#!/bin/sh -eux

apt-get install sudo nfs-common portmap rsync -y
apt-get install qemu-guest-agent spice-vdagent -y
