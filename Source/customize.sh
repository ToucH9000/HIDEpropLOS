# Error on < Android 8
if [ "$API" -lt 26 ]; then
    abort "!!! You can't use this module on Android < 8.0."
fi

# safetynet-fix module is incompatible
if [ -d "/data/adb/modules/safetynet-fix" ]; then
    ui_print "!!! safetynet-fix module removed!"
    rm -rf "/data/adb/modules/safetynet-fix"
	rm -rf "/data/adb/SNFix.dex"
fi

# use our resetprop
mv -f "$MODPATH/bin/$ABI/resetprop" "$MODPATH"
rm -rf "$MODPATH/bin"