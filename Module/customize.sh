# Error on < Android 8
if [ "$API" -lt 26 ]; then
    abort "!!! You can't use this module on Android < 8.0."
fi

# safetynet-fix module is incompatible
if [ -d "/data/adb/modules/safetynet-fix" ]; then
    touch "/data/adb/modules/safetynet-fix/remove"
	ui_print "- 'safetynet-fix' module will be removed in next reboot."
fi

# Use custom resetprop only in Android 10+
mv -f "$MODPATH/bin/$ABI/resetprop" "$MODPATH"
rm -rf "$MODPATH/bin"