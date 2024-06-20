#!/bin/bash

if [ -z "$1" ]
then
	echo "Usage: ./install.sh [VM_NAME]" >/dev/stderr
	exit 1
fi

if [ "$(whoami)" != "root" ]
then
	echo "Must be run as root" >/dev/stderr
	exit 1
fi

initial_dir=$(pwd)
cd "$(dirname "$(realpath "$BASH_SOURCE")")"

cat 99-hotplug.rules | sed "s/__VM_NAME__/$1/" >/etc/udev/rules.d/99-hotplug.rules
mkdir -p  "/etc/libvirt/hooks/qemu.d/$1"
chmod 775 "/etc/libvirt/hooks/qemu.d/$1"
cat usb_passthrough.sh | sed "s/__VM_NAME__/$1/" >"/etc/libvirt/hooks/qemu.d/$1/usb_passthrough.sh"
cp usb_passthrough_hook.sh "/etc/libvirt/hooks/qemu.d/$1/started/begin/usb_passthrough_hook.sh"
chmod +x "/etc/libvirt/hooks/qemu.d/$1/usb_passthrough.sh"

cd "$initial_dir"
