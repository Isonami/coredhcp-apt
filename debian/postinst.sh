if [ "$1" = "configure" ] || [ "$1" = "abort-upgrade" ] || [ "$1" = "abort-deconfigure" ] || [ "$1" = "abort-remove" ] ; then
        # This will only remove masks created by d-s-h on package removal.
        deb-systemd-helper unmask 'coredhcp.service' >/dev/null || true

        # was-enabled defaults to true, so new installations run enable.
        if deb-systemd-helper --quiet was-enabled 'coredhcp.service'; then
                # Enables the unit on first installation, creates new
                # symlinks on upgrades if the unit file has changed.
                deb-systemd-helper enable 'coredhcp.service' >/dev/null || true
        else
                # Update the statefile to add new symlinks (if any), which need to be
                # cleaned up on purge. Also remove old symlinks.
                deb-systemd-helper update-state 'coredhcp.service' >/dev/null || true
        fi
fi
