MODDIR="${0%/*}"
MODNAME="${MODDIR##*/}"

. "$MODDIR/UwU.sh"

# Conditional early sensitive properties

resetprop_if_diff() {
    local NAME=$1
    local EXPECTED=$2
    local CURRENT=$(resetprop $NAME)
    
    [ -z "$CURRENT" ] || [ "$CURRENT" == "$EXPECTED" ] || resetprop $NAME $EXPECTED
}

resetprop_if_match() {
    local NAME=$1
    local CONTAINS=$2
    local VALUE=$3
    
    [[ "$(resetprop $NAME)" == *"$CONTAINS"* ]] && resetprop $NAME $VALUE
}

# RootBeer, Microsoft
resetprop_if_diff ro.build.tags release-keys
resetprop_if_diff ro.build.type user

# Other
resetprop_if_diff ro.debuggable 0
resetprop_if_diff ro.secure 1

for prefix in system bootimage vendor system_ext product oem odm vendor_dlkm odm_dlkm; do
    check_resetprop ro.${prefix}.build.type user
done

# Lineage
resetprop_if_diff ro.build.flavor vayu-user
replace_value_resetprop ro.build.display.id "lineage_vayu-userdebug" "vayu-user"