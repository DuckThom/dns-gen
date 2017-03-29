dnsmasq: dnsmasq -k -u root -h -H /etc/hosts.additional --log-facility=-
dockergen: docker-gen -watch -notify "killall -HUP dnsmasq" /hosts.tmpl /etc/hosts.additional
