# Remove Play Services from the Magisk Denylist when set to enforcing
if magisk --denylist status; then
    magisk --denylist rm com.google.android.gms
fi

# Check if safetynet-fix is installed
if [ -d "/data/adb/modules/safetynet-fix" ]; then
    rm -rf "/data/adb/modules/safetynet-fix"
	rm -rf "/data/adb/SNFix.dex"
fi

MODDIR="${0%/*}"
MODNAME="${MODDIR##*/}"

. "$MODDIR/UwU.sh"

replace_value_resetprop ro.build.display.id "lineage_vayu-userdebug" "vayu-user"