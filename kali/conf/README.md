# Proxychains

[Github proxychains-ng](https://github.com/rofl0r/proxychains-ng)

In Kali Linux w/ systemd commmands to verify proxychains service:

```bash
systemctl enable tor.service
systemctl restart tor.service
systemctl status tor.service
```

Proxychains usage, in this example it will run curl through proxy(or chained proxies) specified by proxychains.conf

```bash
proxychains -f /etc/proxychains.conf curl <target>
```