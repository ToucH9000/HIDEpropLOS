MODDIR="${0%/*}"
. "$MODDIR/UwU.sh"

# RIP Lineage
replace_value_resetprop ro.build.display.id "lineage_vayu-userdebug" "vayu-user"

for prefix in bootimage odm product system system_ext vendor vendor_dlkm; do
    check_resetprop ro.${prefix}.build.type user
done
for prefix in bootimage odm product system system_ext vendor vendor_dlkm; do
    check_resetprop ro.product.${prefix}.name vayu
done

resetprop --delete ro.lineage.device
resetprop --delete ro.lineage.version
resetprop --delete ro.lineagelegal.url
resetprop --delete ro.lineage.releasetype
resetprop --delete ro.lineage.build.version
resetprop --delete ro.lineage.display.version
resetprop --delete ro.lineage.build.version.plat.rev
resetprop --delete ro.lineage.build.version.plat.sdk