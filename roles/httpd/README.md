# Httpd apache

## description
Deploys a httpd apache container:

* persistent storage mounts /var/lib/httpd-\<instancename\>/ 
* exposes http/https ports 
* serves a placeholder and health pages
* shows lists of blackbox urls on placeholder pages

## documentation

* https://github.com/apache/httpd
* https://hub.docker.com/_/httpd

## dependecies

* host must belong to inventory group *httpd* with *inventory/group_vars/httpd.yml*
* *users-and-groups* role
* *firewall* role
* *letsencrypt* role for keys

## group_vars, host_vars and vault vars

| var name                           | var source                          | description                                              |
|------------------------------------|-------------------------------------|----------------------------------------------------------|
| _httpd_image_tag                   | inventory/group_vars/httpd.yml      | docker image tag httpd:<tag>                             |
| _httpd_users                       | inventory/group_vars/httpd.yml      | uid/gid used to run container, see users_and_groups role |
| _httpd_sites                       | inventory/hostvar_vars/somehost.yml | httpd site parameters, see below                         |
| _blackbox_http_2xx_targets         | inventory/group_vars/all.yml        | list of urls                                             |
| _blackbox_http_jenkins_2xx_targets | inventory/group_vars/all.yml        | list of urls                                             |
| _mail_address                      | inventory/group_vars/all.yml        | email address                                            |


example:
```bash
_httpd_sites:
  - { sitename: 'somename', url: 'www.somedomainname.duckdns.org', http_port: '30080', https_port: '30443' }
  - { sitename: 'somename', url: 'www.somedomainname.duckdns.org', http_port: '31080', https_port: '31443' }
```
