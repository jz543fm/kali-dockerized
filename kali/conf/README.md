# TOR + Proxychains

[Github proxychains-ng](https://github.com/rofl0r/proxychains-ng)

In Kali Linux w/ systemd commmands to play with tor service:

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

Get IPs (3 methods):

```bash
proxychains -f /etc/proxychains.conf curl https://ipinfo.io/ip
proxychains -f /etc/proxychains.conf wget -qO- https://api.ipify.org
proxychains -f /etc/proxychains.conf curl -s https://ifconfig.me
```

## How to configure TOR with bridges

What is a [bridge?](https://support.torproject.org/censorship/censorship-7/)

Something about [Obsfproxy](https://github.com/Yawning/obfs4/blob/master/doc/obfs4-spec.txt)

I've found this [repo](https://github.com/devshashtag/TorBridge) but it CLI it does not work due to X Display!!!
Actually I've tried it manually:

Install `obfs4proxy`:

```bash
apt install obfs4proxy
```

Open in your browser URL `https://bridges.torproject.org/` and get bridges (select from options if u need plugable transport or the usage of IPv4 or IPv6) then it generates CAPTCHA after u success in CAPTCHA it will provide bridges

Edit `/etc/tor/torcc` and add this line, where last lines should be ur bridges:

```bash
UseBridges 1 
ClientTransportPlugin obfs4 exec /usr/bin/obfs4proxy
Bridge obfs4 50.39.226.171:47368 93BBD8F80D5F5A8A55829A3168278327BABC14D7 cert=e7kfc/GAUTzv6OEu/a9zQnzGQu9dzhs4jZSmKCXYCaOVZUf5vci2KKilPzR6pUKiiO9hNA iat-mode=0
# This above is just example
```

Restart tor service:

```bash
service tor restart
# Check the logs for proper error
journalctl -exft Tor
```