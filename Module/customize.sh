# Use custom resetprop only in Android 10+
mv -f "$MODPATH/bin/$ABI/resetprop" "$MODPATH"
rm -rf "$MODPATH/bin"