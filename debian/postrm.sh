if [ "$1" = "remove" ]; then
        if [ -x "/usr/bin/deb-systemd-helper" ]; then
                deb-systemd-helper mask 'consul-etcddiscovery.service' >/dev/null || true
        fi
fi

if [ "$1" = "purge" ]; then
        if [ -x "/usr/bin/deb-systemd-helper" ]; then
                deb-systemd-helper purge 'consul-etcddiscovery.service' >/dev/null || true
                deb-systemd-helper unmask 'consul-etcddiscovery.service' >/dev/null || true
        fi
fi
