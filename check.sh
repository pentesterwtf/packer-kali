#/bin/bash

# Compares the SHA256 sum of the published kali image vs the one stored here
# Used to figure out if a new release exists, then build it


# Get the hash of the most up to date iso
UPSTREAM_CHECKSUM=$(curl -sL $(jq -r .variables.iso_checksum_url packer.json) | grep mini.iso | head -c 64)

# Get the hash we have in our repo
OUR_CHECKSUM=$(jq -r .variables.iso_checksum packer.json)

if [ "$UPSTREAM_CHECKSUM" == "$OUR_CHECKSUM" ]; then
	echo "Latest hash"
else
	echo "New release, updating hash"
	sed -i "s/$OUR_CHECKSUM/$UPSTREAM_CHECKSUM/" packer.json
fi
