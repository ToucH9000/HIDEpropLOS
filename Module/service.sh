# Sensitive properties

RESETPROP="${0%/*}/resetprop"

if [ -e "$RESETPROP" ]; then
	chmod 755 $RESETPROP
else
	RESETPROP="resetprop"
fi

check_resetprop() {
  local NAME=$1
  local EXPECTED=$2
  local VALUE=$(resetprop $NAME)
  [ -z $VALUE ] || [ $VALUE = $EXPECTED ] || $RESETPROP -n $NAME $EXPECTED
}

maybe_set_prop() {
    local prop="$1"
    local contains="$2"
    local value="$3"

    if [[ "$(getprop "$prop")" == *"$contains"* ]]; then
        $RESETPROP -n "$prop" "$value"
    fi
}

# Magisk recovery mode
maybe_set_prop ro.bootmode recovery unknown
maybe_set_prop ro.boot.mode recovery unknown
maybe_set_prop vendor.boot.mode recovery unknown

# Hiding SELinux | Permissive status
if [ -n "$(getprop ro.build.selinux)" ]; then
	$RESETPROP --delete ro.build.selinux
fi

# Hiding SELinux | Use toybox to protect *stat* access time reading
if [ "$(toybox cat /sys/fs/selinux/enforce)" == "0" ]; then
    chmod 640 /sys/fs/selinux/enforce
    chmod 440 /sys/fs/selinux/policy
fi

# Reset props after boot completed to avoid breaking some weird devices/ROMs...
{
    until [[ "$(resetprop sys.boot_completed)" == "1" ]]; do
        sleep 1
    done

    # Prop from HuskyDG
    check_resetprop sys.oem_unlock_allowed 0

    # SafetyNet/Play Integrity | Avoid breaking Realme fingerprint scanners
    check_resetprop ro.boot.flash.locked 1

    # SafetyNet/Play Integrity | Avoid breaking Oppo fingerprint scanners
    check_resetprop ro.boot.vbmeta.device_state locked

    # SafetyNet/Play Integrity | Avoid breaking OnePlus display modes/fingerprint scanners
    check_resetprop vendor.boot.verifiedbootstate green

    # SafetyNet/Play Integrity | Avoid breaking OnePlus display modes/fingerprint scanners on OOS 12
    check_resetprop ro.boot.verifiedbootstate green
    check_resetprop ro.boot.veritymode enforcing
    check_resetprop vendor.boot.vbmeta.device_state locked
}&