# Need More Power?

In order to hide **Custom Rom** status from detection apps you need to rename "addon.d" folder to random name in system partion, It is recommended to rename again to "addon.d" before updating/upgrading the rom.

In order to hide **init.rc Modification** from detection apps you need to rename "install-recovery.sh" file to random name in vendor/bin partion, It is recommended to rename again to "install-recovery.sh" before updating/upgrading the rom.

In order to hide **Native Bridge Injection** you have to edit "build.prop" file which is located in system partion.<br>**Before Edit**<br>```ro.dalvik.vm.native.bridge=0```<br>**After Edit**<br>```#ro.dalvik.vm.native.bridge=0```<br>Save file and reboot.
