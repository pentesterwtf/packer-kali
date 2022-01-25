#!/bin/bash

# Used for internal CI
# Probably not much value for others, but YMMV :)

set -eux

# Remove existing artefacts
rm -rf packer_cache output-qemu builds

#Do the build
packer build packer.json

# Copy output
cp output-qemu/kali-linux-rolling ~/kali-linux-rolling
cp builds/kali-linux-rolling.box ~/kali-linux-rolling.box

# Push output to S3
mc cp ~/kali-linux-rolling s3/pentesterwtf/qemu/kali.qcow2
mc cp ~/kali-linux-rolling.box s3/pentesterwtf/vagrant/kali.box

# Delete artefacts
rm -f ~/kali-linux-rolling; rm -f ~/kali-linux-rolling.box
