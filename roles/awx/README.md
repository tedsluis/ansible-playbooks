# Ansible Role: awx

## Description

Deploys awx using ansible.

* supports https (default port 443)

## documentation

* https://docs.ansible.com/ansible-tower
* https://github.com/ansible/awx
* https://hub.docker.com/r/ansible/awx

## dependecies

* host must belong to inventory group *awx* with *inventory/group_vars/awx.yml*
* *dnsmasq* role
* *firewall* role
* *letsencrypt* role
* *packages* role
* *users-and-groups* role

## varibles

default variable values can be found in [defaults/main.yml](defaults/main.yml)

| var name                         | var source                      | description                              |
|----------------------------------|---------------------------------|------------------------------------------|
| _awx_tag                         | inventory/group_vars/awx.yml    | git tag & docker image                   |
| _awx_password                    | inventory/group_vars/all.yml    | encrypted awx admin password             |
| _awx_broadcast_websocket_secret  | inventory/group_vars/all.yml    | encrypted broadcast websocket secret     |
| _awx_pg_password                 | inventory/group_vars/all.yml    | encrypted postgres password              |
| _awx_secret_key                  | inventory/group_vars/all.yml    | encrypted awx secret key                 |
| _dockerio_username               | inventory/group_vars/all.yml    | docker registry username                 |
| _dockerio_token                  | inventory/group_vars/all.yml    | docker registry token                    |
| _letsencrypt_hostname            | inventory/group_vars/all.yml    | fqdn letsencrypt host                    |
| _awx_hostname                    | inventory/group_vars/all.yml    | fqdn awx host                            |
