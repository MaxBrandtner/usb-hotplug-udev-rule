#!/bin/bash

virsh --connect qemu:///system attach-device __VM_NAME__ /dev/stdin <<END
<hostdev mode='subsystem' type='usb' managed='yes'>
	<source startupPolicy='optional'>
		<vendor id='0x$1'/>
		<product id='0x$2'/>
	</source>
</hostdev>
END

exit 0
