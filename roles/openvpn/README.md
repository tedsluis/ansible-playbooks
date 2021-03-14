# Openvpn

## documentation

* https://github.com/kylemanna/docker-openvpn
* https://github.com/kumina/openvpn_exporter

## init
```
$ podman  run -v /var/lib/openvpn/data/:/etc/openvpn:z --rm localhost/openvpn ovpn_genconfig -u udp://openvpn.bachstraat20.duckdns.org -n 192.168.1.17
$ podman  run -v /var/lib/openvpn/data/:/etc/openvpn:z --rm -it localhost/openvpn ovpn_initpki
```

## test
```
$ podman  run -v /var/lib/openvpn/data/:/etc/openvpn:z --log-driver=journald --rm --device /dev/net/tun  --privileged -p 1194:1194/udp   -it localhost/openvp
```

## create client certs
```
$ podman  run -v /var/lib/openvpn/data/:/etc/openvpn:z --rm -it localhost/openvpn easyrsa build-client-full tedsluis-nopass nopass
$ podman  run -v /var/lib/openvpn/data/:/etc/openvpn:z --rm -it localhost/openvpn easyrsa build-client-full tedsluis-pass
```

## list clients
```
$ podman  run -v /var/lib/openvpn/data/:/etc/openvpn:z --rm -it localhost/openvpn ovpn_listclients
name,begin,end,status
tedsluis-nopass,Feb 14 17:22:11 2021 GMT,May 20 17:22:11 2023 GMT,VALID
tedsluis-pass,Feb 14 17:29:23 2021 GMT,May 20 17:29:23 2023 GMT,VALID
```

## export client cert
```
$ podman  run -v /var/lib/openvpn/data/:/etc/openvpn:z --rm -it localhost/openvpn ovpn_getclient tedsluis-nopass > /root/tedsluis-nopass.ovpn
$ podman  run -v /var/lib/openvpn/data/:/etc/openvpn:z --rm -it localhost/openvpn ovpn_getclient tedsluis-pass > /root/tedsluis-pass.ovpn
```

## debug
```
$ podman exec -it $CONTAINER_ID cat /tmp/openvpn-status.log
$ podman run --rm -it -v $OVPN_DATA:/etc/openvpn:z kylemanna/openvpn ovpn_status
```

