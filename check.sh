#/bin/bash

# Internal use only - do not distribute
# Compares the SHA256 sum of the published kali image vs the one stored here

wget $(jq -r ".variables.iso_url" kali.json)
echo "$(jq -r .variables.iso_checksum kali.json) mini.iso" | sha256sum --check -
