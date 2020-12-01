# Letsencrypt swag

## description
Deploys a letsencrypt swag container:

* persistent storage mount /var/lib/letsencrypt/
* generates letsencrypt wildcard certificate for duckdns.org sub domain
* keys will be stored in /var/lib/letsencript/keys/

## documentation

* https://github.com/linuxserver/docker-swag
* https://hub.docker.com/r/linuxserver/swag

## dependecies

* duckdns account, domain and token [https://www.duckdns.org](https://www.duckdns.org/faqs.jsp)
* host must belong to inventory group *letsencrypt* with *inventory/group_vars/letsencrypt.yml*
* *firewall* role
* *users-and-groups* role
* *packages* role

## group_vars, host_vars and vault vars.

default variable values can be found in [defaults/main.yml](defaults/main.yml)

| var name               | var source                           | description                             |
|------------------------|--------------------------------------|-----------------------------------------|
| _duckdns_token         | inventory/group_vars/vault.yaml      | your duckdn token                       |
| _letsencrypt_domain    | inventory/group_vars/letsencrypt.yml | your wildcard domain                    |
| _letsencrypt_image_tag | inventory/group_vars/letsencrypt.yml | docker image tag linuxserver/swag:<tag> |
| _letsencrypt_staging   | inventory/group_vars/letsencrypt.yml | true = testing / false = production     |
| _letsencrypt_users     | inventory/group_vars/letsencrypt.yml | uid/gid used to run container           |
| _mail_address          | inventory/group_vars/all.yml         | your mail address                       |
| _timezone              | inventory/group_vars/all.yml         | your timezone                           |

