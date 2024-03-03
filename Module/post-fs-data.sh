resetprop_if_diff() {
    local NAME="$1"
    local EXPECTED="$2"
    local CURRENT="$(resetprop "$NAME")"

    [ -z "$CURRENT" ] || [ "$CURRENT" = "$EXPECTED" ] || resetprop "$NAME" "$EXPECTED"
}

replace_value_resetprop(){
    local VALUE="$(resetprop -v "$1")"
    [ -z "$VALUE" ] && return
    local VALUE_NEW="$(echo -n "$VALUE" | sed "s|${2}|${3}|g")"
    [ "$VALUE" == "$VALUE_NEW" ] || resetprop -v -n "$1" "$VALUE_NEW"
}

resetprop_if_diff ro.build.tags release-keys

resetprop_if_diff ro.boot.warranty_bit 0

resetprop_if_diff ro.vendor.boot.warranty_bit 0

resetprop_if_diff ro.vendor.warranty_bit 0

resetprop_if_diff ro.warranty_bit 0

resetprop_if_diff ro.is_ever_orange 0

resetprop_if_diff ro.build.type user

resetprop_if_diff ro.debuggable 0

resetprop_if_diff ro.secure 1

resetprop_if_diff ro.build.user android-build

resetprop_if_diff ro.product.name vayu

resetprop_if_diff ro.build.flavor vayu-user

replace_value_resetprop ro.build.display.id "lineage_vayu-userdebug" "vayu-user"

for prefix in bootimage odm product system system_ext vendor vendor_dlkm; do
    resetprop_if_diff ro.${prefix}.build.type user
done

for prefix in bootimage odm product system system_ext vendor vendor_dlkm; do
    resetprop_if_diff ro.product.${prefix}.name vayu
done