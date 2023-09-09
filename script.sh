#!/usr/bin/env bash

file="/etc/docker/daemon.json"
default='
{
 "features": {
    "buildkit": true
  }
}
'

# Check if the file exists
if [ -f "$file" ]; then
    # Check if the file is empty
    if [ -s "$file" ]; then
        # Use sed to replace "false" with "true"
        sed -i 's/"buildkit": false/"buildkit": true/g' "$file"
        echo "Modified $file: Changed 'false' to 'true' for 'buildkit'"
	echo -e "Restarting docker, wait a sec!\n"
	systemctl restart docker
    else
        echo -e "File is empty: $file \n"
	echo "$default" >> "$file"
	echo -e "Created demo config in $file"
        echo -e "Restarting docker, wait a sec!\n"
        systemctl restart docker
    fi
else
    echo "File not found: $file"
    touch $file;
    echo "Created a new $file"
    echo "$default" >> "$file"
    echo -e "Created demo config in $file"
    echo -e "Restarting docker, wait a sec!\n"
    systemctl restart docker
fi