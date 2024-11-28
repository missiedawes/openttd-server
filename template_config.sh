#!/bin/bash

# Define variables
OPENTTD_SERVER_CONFIG_TEMPLATE_URL="${OPENTTD_SERVER_CONFIG_TEMPLATE_URL:-https://raw.githubusercontent.com/missiedawes/openttd-server-cfg/refs/heads/main/default/openttd.cfg}"

OPENTTD_SERVER_CONFIG_TEMPLATE_FILENAME="openttd.cfg"
OPENTTD_SERVER_CONFIG_DOWNLOAD_PATH="/${OPENTTD_SERVER_CONFIG_TEMPLATE_FILENAME}"
OPENTTD_SERVER_CONFIG_CONFIG_PATH="/home/openttd/${OPENTTD_SERVER_CONFIG_TEMPLATE_FILENAME}"

# Download the template
echo "Downloading template..."
curl -o $OPENTTD_SERVER_CONFIG_DOWNLOAD_PATH $OPENTTD_SERVER_CONFIG_TEMPLATE_URL

# Process the template using envsubst
echo "Processing template..."
envsubst < $OPENTTD_SERVER_CONFIG_DOWNLOAD_PATH > $OPENTTD_SERVER_CONFIG_CONFIG_PATH

echo "Done."
