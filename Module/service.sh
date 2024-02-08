# Conditional sensitive properties

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

# Magisk recovery mode
resetprop_if_match ro.bootmode recovery unknown
resetprop_if_match ro.boot.mode recovery unknown
resetprop_if_match vendor.boot.mode recovery unknown

# SELinux
if [ -n "$(resetprop ro.build.selinux)" ]; then
    resetprop --delete ro.build.selinux
fi

# use toybox to protect *stat* access time reading
if [ "$(toybox cat /sys/fs/selinux/enforce)" == "0" ]; then
    chmod 640 /sys/fs/selinux/enforce
    chmod 440 /sys/fs/selinux/policy
fi

# must be set after boot_completed for various OEMs
until [ "$(getprop sys.boot_completed)" == "1" ]; do
    sleep 1
done

# RootBeer, Microsoft
resetprop_if_diff ro.build.tags release-keys
resetprop_if_diff ro.build.type user
resetprop_if_diff ro.product.name vayu

# Other
resetprop_if_diff ro.debuggable 0
resetprop_if_diff ro.secure 1

# Lineage
resetprop_if_diff ro.build.flavor vayu-user

# make banking apps happy
resetprop_if_diff sys.oem_unlock_allowed 0

# avoid breaking OnePlus/Oppo display fingerprint scanners on OOS/ColorOS 12+
resetprop_if_diff ro.boot.verifiedbootstate green