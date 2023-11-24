replace_value_resetprop(){
    local VALUE="$(resetprop -v "$1")"
    [ -z "$VALUE" ] && return
    local VALUE_NEW="$(echo -n "$VALUE" | sed "s|${2}|${3}|g")"
    [ "$VALUE" == "$VALUE_NEW" ] || resetprop -v -n "$1" "$VALUE_NEW"
}