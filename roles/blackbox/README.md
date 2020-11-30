# Ansible Role: blackbox

## Description

Deploys blackbox using ansible.

* supports http (default port 9115)

## documentation

* https://github.com/prometheus/blackbox_exporter
* https://hub.docker.com/r/prom/blackbox-exporter/

## dependecies

* host must belong to inventory group *blackbox* with *inventory/group_vars/blackbox.yml*
* *dnsmasq* role
* *firewall* role
* *letsencrypt* role
* *packages* role
* *users-and-groups* role

## varibles

default variable values can be found in [defaults/main.yml](defaults/main.yml)

| var name                   | var source                      | description                                   |
|----------------------------|---------------------------------|-----------------------------------------------|
| _blackbox_image_tag        | inventory/group_vars/gitea.yml  | docker image tag prom/blackbox-exporter:<tag> |
| _node_exporter_auth_pass   | inventory/group_vars/all.yml    | encrypted nodeexporter secret                 |