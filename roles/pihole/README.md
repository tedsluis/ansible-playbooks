# Pihole

## description
Deploys pihole

note: when systemd-resolved is running (fedora 33+), it will be disabled.

## documentation

* https://hub.docker.com/r/pihole/pihole

## dependecies

* host must belong to inventory group *pihole* with *inventory/group_vars/pihole.yml*
* *firewall* role
* *packages* role

## group_vars, host_vars and vault vars.

| var name                          | var source                           | description                             |
|-----------------------------------|--------------------------------------|-----------------------------------------|
| _mail_address                     | inventory/group_vars/all.yml         | your mail address                       |
| _timezone                         | inventory/group_vars/all.yml         | your timezone                           |
| _pihole_image_version: latest     | inventory/group_vars/pihole.yml      | pihole image version                    |
| _pihole_image_name: pihole/pihole | inventory/group_vars/pihole.yml      | image name                              |
| _pihole_image_repo: docker.io     | inventory/group_vars/pihole.yml      | registry                                |
| _pihole_password                  | inventory/group_vars/vault.yml       | admin password pihole                   |

