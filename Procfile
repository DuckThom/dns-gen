dnsmasq: dnsmasq -q -k -u root -h --dns-forward-max=300 -H /etc/hosts.additional --log-facility=- -r /etc/resolv-override.conf
dockergen: docker-gen -watch -notify "killall -HUP dnsmasq" /hosts.tmpl /etc/hosts.additional
