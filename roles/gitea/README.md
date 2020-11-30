# Gitea 

## description
Deploys a gitea container:

* supports https (default port 3000) and ssh (default port 2222)
* supports secure ssl/tls using letsencrypt certificate
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
* *letsencrypt* role
* *packages* role
* *postgres* role
* *users-and-groups* role

## group_vars, host_vars and vault vars.

default variable values can be found in [defaults/main.yml](defaults/main.yml)

| var name                   | var source                      | description                        |
|----------------------------|---------------------------------|------------------------------------|
| _gitea_admin_user          | inventory/group_vars/gitea.yml  | admin user                         |
| _gitea_admin_password      | inventory/group_vars/all.yml    | encrypted admin password           |
| _mail_address              | inventory/group_vars/all.yml    | email address                      |
| _postgres_password_giteadb | inventory/group_vars/all.yaml   | encrypted postgres password        |
| _gitea_image_tag           | inventory/group_vars/gitea.yml  | docker image tag gitea/gitea:<tag> |
| _gitea_properties          | inventory/group_vars/gitea.yml  | properties gitea, see below        |
| _gitea_secret_key          | inventory/group_vars/all.yaml   | encrypted random at every install  |
| _gitea_internal_token      | inventory/group_vars/all.yaml   | encrypted random at every install  |
| _gitea_jwt_secret:         | inventory/group_vars/all.yaml   | encrypted unique string            |
| _gitea_lfs_jwt_secret      | inventory/group_vars/all.yaml   | encrypted unique string            |


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

## notes

* create a dns record for the *domain* and *sshdomain*.
* for SSH, add public key(s) and update/resync for the site admin dashboard. 
