#!/bin/bash

# Used for internal CI
# Probably not much value for others, but YMMV :)

set -eux

# Remove existing artefacts
rm -rf packer_cache output-qemu builds

#Do the build
packer build packer.json

# Push output to S3
mc cp output-qemu/kali-linux-rolling s3/pentesterwtf/qemu/kali.qcow2
