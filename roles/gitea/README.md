# Gitea 

## description
Deploys a gitea container:

* persistent storage mount /var/lib/gitea/
* 

## documentation

* https://gitea.io
* https://github.com/go-gitea/gitea
* https://hub.docker.com/r/gitea/gitea

## dependecies

* host must belong to inventory group *gitea* with *inventory/group_vars/gitea.yml*
* host must belong to inventory group *postgres* with *inventory/group_vars/postgres.yml*
* *firewall* role
* *users-and-groups* role
* *packages* role

## group_vars, host_vars and vault vars.

| var name                   | var source                      | description                        |
|----------------------------|---------------------------------|------------------------------------|
| _postgres_password_giteadb | inventory/group_vars/vault.yaml | postgres password                  |
| _gitea_image_tag           | inventory/group_vars/gitea.yml  | docker image tag gitea/gitea:<tag> |
| _gitea_properties          | inventory/group_vars/gitea.yml  | properties gitea, see below        |


```bash
_gitea_properties:
  - { appname: 'gitea', podman_network: 'gitea', ui_port: '3000', domain: 'git.somedomain.duckdns.org', sshdomain: 'git.somedomain.duckdn.org', uid: '<uid>', gui: '<gui>', db_port: '5432', db_host: 'giteadb', db_name: 'giteadb', db_user: 'giteadb', password_var: '_postgres_password_giteadb' } 
```


