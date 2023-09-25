# Proxychains

[Github](https://github.com/haad/proxychains)

In Kali Linux w/ systemd commmands to verify proxychains service:

systemctl enable tor.service
systemctl restart tor.service
systemctl status tor.service

Proxychains usage, in this example it will run curl through proxy(or chained proxies) specified by proxychains.conf


proxychains -f /etc/proxychains.conf curl <target>