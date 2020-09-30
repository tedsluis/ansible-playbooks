# Gitea 

## description
Deploys a gitea container:

* expose https ui with letsencrypt certificate
* persistent storage mount /var/lib/gitea/

## documentation

* https://gitea.io
* https://github.com/go-gitea/gitea
* https://hub.docker.com/r/gitea/gitea

## dependecies

* host must belong to inventory group *gitea* with *inventory/group_vars/gitea.yml*
* host must belong to inventory group *postgres* with *inventory/group_vars/postgres.yml*
* *dnsmasq* role
* *firewall* role
* *packages* role
* *users-and-groups* role

## group_vars, host_vars and vault vars.

| var name                   | var source                      | description                        |
|----------------------------|---------------------------------|------------------------------------|
| _postgres_password_giteadb | inventory/group_vars/vault.yaml | postgres password                  |
| _gitea_image_tag           | inventory/group_vars/gitea.yml  | docker image tag gitea/gitea:<tag> |
| _gitea_properties          | inventory/group_vars/gitea.yml  | properties gitea, see below        |
| _gitea_secret_key          | inventory/group_vars/vault.yaml | random at every install            |
| _gitea_internal_token      | inventory/group_vars/vault.yaml | random at every install            |
| _gitea_jwt_secret:         | inventory/group_vars/vault.yaml | unique string                      |
| _gitea_lfs_jwt_secret      | inventory/group_vars/vault.yaml | unique string                      |


In *inventory/group_vars/gitea.yml* or in *inventory/host_var/somehost.yml*:
```bash
_gitea_properties:
  appname: 'gitea'
  podman_network: 'gitea'
  ui_port: '3000'
  ssh_port: '2222'
  domain: 'git.somedomain.duckdns.org'
  sshdomain: 'git.somedomain.duckdn.org'
  run_user: 'git'
  uid: '1033'
  gid: '1033'
  db_port: '5432'
  db_host: 'postgres-gitea'
  db_name: 'giteadb'
  db_user: 'giteadb'
  password_var: '_postgres_password_giteadb'
```


