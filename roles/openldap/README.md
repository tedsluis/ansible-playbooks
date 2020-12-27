
# Ansible Role: openldap

## Description

Deploys openldap using ansible.

* supports http (default port 9093)
* support slack notifications

## documentation

* https://prometheus.io/docs/alerting/latest/openldap/
* https://github.com/prometheus/openldap
* https://hub.docker.com/r/prom/openldap

## Requirements

- slack webhook url, see [defaults](defaults/main.yml)

## dependecies

* host must belong to inventory group *openldap* with *inventory/group_vars/openldap.yml*
* *dnsmasq* role
* *firewall* role
* *letsencrypt* role
* *packages* role
* *users-and-groups* role

## group_vars, host_vars and vault vars.

| var name                   | var source                      | description                              |
|----------------------------|---------------------------------|------------------------------------------|
| _openldap_image_tag    | inventory/group_vars/gitea.yml  | docker image tag prom/openldap:<tag> |
| _slack_webhook_secret      | defaults/main.yml               | slack webhook secret                     |


