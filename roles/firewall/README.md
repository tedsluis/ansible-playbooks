# firewall

## description

Gether and merge ports with protocols from  _\<somename\>_firewall variables from the *host_var* and *group_vars* of a host to configure it's firewall.

## group_vars en host_vars

| var name           | var type                            | description                             |
|--------------------|-------------------------------------|-----------------------------------------|
| _somename_firewall | inventory/group_vars/somegroup.yml  | firewall settings that facts a group    |
| _somename_firewall | inventory/hostvar_vars/somehost.yml | firewall settings that facts a host     |


```bash
_somename_firewall:
  - <port number>/<protocol>
  -1234/tcp
  -3456/udp
```

note: ports that should not be open will be closed!
