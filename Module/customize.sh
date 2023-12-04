# Check custom pif.json
if [ -e /data/adb/pif.json ]; then
    ui_print "!!! WARNING, You are using a custom pif.json. Module will use it."
	ui_print "!!! If you want to use recommended one, delete pif.json in data/adb partition."
fi

# curl & resetprop
mv -f $MODPATH/bin/$ABI/curl $MODPATH
mv -f $MODPATH/bin/$ABI/resetprop $MODPATH

rm -rf $MODPATH/bin

set_perm $MODPATH/curl root root 777
set_perm $MODPATH/resetprop root root 777