# LineageOS Hiding x2
MODDIR="${0%/*}"
MODNAME="${MODDIR##*/}"

. "$MODDIR/UwU.sh"

replace_value_resetprop ro.build.display.id "lineage_vayu-userdebug" "vayu-user"