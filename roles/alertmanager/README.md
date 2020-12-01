
# Ansible Role: alertmanager

## Description

Deploys alertmanager using ansible.

* supports http (default port 9093)
* support slack notifications

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

| var name                   | var source                            | description                              |
|----------------------------|---------------------------------------|------------------------------------------|
| _alertmanager_image_tag    | inventory/group_vars/alertmanager.yml | docker image tag prom/alertmanager:<tag> |
| _slack_webhook_secret      | inventory/group_vars/all.yml          | encrypted slack webhook secret           |


