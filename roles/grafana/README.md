
# Ansible Role: grafana

## Description

Deploys grafana using ansible.

* supports https (default port 3000)

## documentation

* https://prometheus.io/docs/alerting/latest/alertmanager/
* https://github.com/prometheus/alertmanager
* https://hub.docker.com/r/prom/alertmanager

## Requirements

- slack webhook url, see [defaults](defaults/main.yml)

## dependecies

* host must belong to inventory group *alertmanager* with *inventory/group_vars/alertmanager.yml*
* *dnsmasq* role
* *firewall* role
* *letsencrypt* role
* *packages* role
* *users-and-groups* role

## varibles

default variable values can be found in [defaults/main.yml](defaults/main.yml)

| var name                   | var source                       | description                              |
|----------------------------|----------------------------------|------------------------------------------|
| _grafana_admin_password    | inventory/group_vars/all.yml     | encrypted grafana password               |
| _grafana_image_tag         | inventory/group_vars/grafana.yml | docker image tag grafana:grafana:<tag>   |
| _letsencrypt_hostname      | inventory/group_vars/all.yml     | Letsencrypt inventory hostname           |
| _grafana_hostname          | inventory/group_vars/all.yml     | grafana hostname                         |
| _prometheus_hostname       | inventory/group_vars/all.yml     | prometheus hostname                      |


