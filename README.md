# USB-hotplug-udev-rule

This is a simple script I use on my PC to setup a udev rule to hotplug USB devices to my VM. Not handling the remove event seems to work fine so I have not bothered adding a remove script. The script seems to work properly on when the VM is set to start automatically though that is most likely due to the VM starting to late to be impacted by the inital attachement of usb devices.

**Dependencies**
- sed

**Usage**
```bash
sudo ./install.sh [VM_NAME]
```
