#!/bin/bash

initial_dir=$(dir)
cd "$(dirname "$(realpath "$BASH_SOURCE")")"

for device in $(lsusb | awk '{print $6}')
do
	./../../usb_passthrough.sh $(echo "$device" | grep -Po '^[0-9a-f]{4}') $(echo "$device" | grep -Po '[0-9a-f]{4}$')	
done

cd "$initial_dir"
