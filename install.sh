#!/bin/bash

# Define version and filenames
FILE="mediamtx_v1.12.3_linux_amd64.tar.gz"
SUMFILE="${FILE}.sha256sum"
BASE_URL="https://github.com/bluenviron/mediamtx/releases/download/v1.12.3"

# Download the tarball and the checksum
echo "Downloading files..."
wget -q --show-progress "${BASE_URL}/${FILE}"
wget -q --show-progress "${BASE_URL}/${SUMFILE}"

# Verify the SHA256 checksum
echo "Verifying checksum..."
if sha256sum -c "${SUMFILE}"; then
    echo "Checksum verified."
    
    # Decompress the archive
    echo "Decompressing..."
    tar -xvzf "${FILE}"
    
    echo "Done."
else
    echo "Checksum verification failed. Exiting."
    exit 1
fi
