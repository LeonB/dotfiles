#!/bin/bash

 # Trigger error when expanding unset variables.  Same as `set -u'.
set -o nounset

FIREWALL_START_COMMAND="/usr/sbin/ufw enable"
FIREWALL_STOP_COMMAND="/usr/sbin/ufw disable"
FIREWALL_SAVED="/tmp/firewall-save.sh"

success() {
    printf " OK"
}
failure() {
    echo " FAILED"
}

# ------------------------------------------------------------------------------
# Make sure we automatically cleanup when we exit.
# WHY:
# Even a CTRL-C will call this and we will not leave temp files.
# Also, if a configuration file breaks, we will detect this too.

firewall_exit() {
    if [ -f "${FIREWALL_SAVED}" ]
    then
        echo -n "Restoring old firewall:"
        iptables-restore <"${FIREWALL_SAVED}"
        if [ $? -eq 0 ]
        then
            success "Restoring old firewall:"
        else
            failure "Restoring old firewall:"
        fi
        echo
    fi

    test -f "${FIREWALL_SAVED}" && rm -f "${FIREWALL_SAVED}"
    return 0
}

fixed_iptables_save() {
        local tmp="/tmp/iptables-save-$$"
        local err=

        iptables-save -c >$tmp
        err=$?
        if [ ! $err -eq 0 ]
        then
                ${RM_CMD} -f $tmp >/dev/null 2>&1
                return $err
        fi

        cat ${tmp} |\
                sed "s/--uid-owner !/! --uid-owner /g"   |\
                sed "s/--gid-owner !/! --gid-owner /g"   |\
                sed "s/--pid-owner !/! --pid-owner /g"   |\
                sed "s/--sid-owner !/! --sid-owner /g"   |\
                sed "s/--cmd-owner !/! --cmd-owner /g"

        err=$?

        rm -f $tmp >/dev/null 2>&1
        return $err
}

# Run our exit even if we don't call exit.
trap firewall_exit EXIT
trap firewall_exit SIGHUP

echo -n "Saving your old firewall to a temporary file:"
fixed_iptables_save > ${FIREWALL_SAVED}
if [ $? -eq 0 ]
then
    success "Saving your old firewall to a temporary file:"
    echo
else
    test -f "${FIREWALL_SAVED}" && ${RM_CMD} -f
    "${FIREWALL_SAVED}"
    failure "Saving your old firewall to a temporary file:"
    echo
    exit 1
fi

echo -n "Activating new firewall:"
$FIREWALL_START_COMMAND >/dev/null

if [ $? -gt 0 ]
then
        failure "Activating new firewall:"
        echo

        # The trap will restore the firewall.
        exit 1
fi

success "Activating new firewall:"
echo

read -p "Keep the firewall? (type 'commit' to accept - 30 seconds timeout) : " -t 30 -e
ret=$?

if [ ! $ret -eq 0 -o ! "${REPLY}" = "commit" ]
then
    # The trap will restore the firewall.
    exit 1
else
    echo "Successfull activation of firewall."
fi

# Remove the saved firewall, so that the trap will not restore it.
rm -f "${FIREWALL_SAVED}"
