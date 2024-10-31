# Need More Power?

In order to hide **Custom Rom**, you need to rename "addon.d" folder to random name in system partition, It is recommended to rename again to "addon.d" before updating/upgrading the rom.

In order to hide **init.rc Modification**, you need to rename "install-recovery.sh" file to random name in vendor/bin partition. It is recommended to rename again to "install-recovery.sh" before updating/upgrading the rom.

In order to hide **Native Bridge Injection**, you have to edit "build.prop" file which is located in system partition.<br>**Before Edit**<br>```ro.dalvik.vm.native.bridge=0```<br>**After Edit**<br>```#ro.dalvik.vm.native.bridge=0```<br>Save file and reboot.


In order to hide **Property Modified**, you need to rename "init_toolbox" file to random name in system/bin partition. It is recommended to rename again to "init_toolbox" before updating/upgrading the rom.
