if [ "$1" = "remove" ]; then
        if [ -x "/usr/bin/deb-systemd-helper" ]; then
                deb-systemd-helper mask 'coredhcp.service' >/dev/null || true
        fi
fi

if [ "$1" = "purge" ]; then
        if [ -x "/usr/bin/deb-systemd-helper" ]; then
                deb-systemd-helper purge 'coredhcp.service' >/dev/null || true
                deb-systemd-helper unmask 'coredhcp.service' >/dev/null || true
        fi
fi
