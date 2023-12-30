# Proxychains

[Github proxychains-ng](https://github.com/rofl0r/proxychains-ng)

In Kali Linux w/ systemd commmands to play with proxychains service:

```bash
systemctl enable tor.service
systemctl restart tor.service
systemctl status tor.service
systemctl stop tor.service
```

Proxychains usage, in this example it will run curl through proxy(or chained proxies) specified by proxychains.conf

```bash
proxychains -f /etc/proxychains.conf curl <target>
```

## Start up proxychaining:

After executing in docker container you need to enable, start tor.service and then you can execute commands over proxychain:

```bash
systemctl enable tor.service
systemctl start tor.service
systemctl status tor.service
```

The output should be:

```bash
● tor.service - Anonymizing overlay network for TCP (multi-instance-master)
     Loaded: loaded (/lib/systemd/system/tor.service; disabled; preset: disabled)
     Active: active (exited) since XX Sep XX XX:XX:XX XX UTC; xmin xsec ago
   Main PID: 310 (code=exited, status=0/SUCCESS)

Sep XX XX:XX:XX XX systemd[1]: Starting tor.service - Anonymizing overlay network for TCP (multi-instance-master)...
Sep XX XX:XX:XX XX systemd[1]: Finished tor.service - Anonymizing overlay network for TCP (multi-instance-master).
```

Afterwards you can use proxychain:

```bash
proxychains -f /etc/proxychains.conf curl <target>
proxychains -f <other_proxy_chain_conf> curl <target>
```

Get IP:

```bash
proxychains -f /etc/proxychains.conf curl https://ipinfo.io/ip
```