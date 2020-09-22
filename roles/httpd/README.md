# Httpd apache

## documentation

* https://github.com/apache/httpd
* https://hub.docker.com/_/httpd

## dependecies

* host belongs to inventory group *httpd* with *inventory/group_vars/httpd.yml*
* letsencrypt role for keys

## vars 

| var                     | source                              | description                             |
|-------------------------|-------------------------------------|-----------------------------------------|
| _httpd_image_tag        | inventory/group_vars/httpd.yml      | docker image tag httpd:<tag>            |
| _httpd_users            | inventory/group_vars/httpd.yml      | uid/gid used to run container           |
| _httpd_sites.sitenames  | inventory/hostvar_vars/somehost.yml | sitename                                |
| _httpd_sites.url        | inventory/hostvar_vars/somehost.yml | dns record that points to host          |
| _httpd_sites.http_port  | inventory/hostvar_vars/somehost.yml | http port                               |
| _httpd_sites.https_port | inventory/hostvar_vars/somehost.yml | https port                              |


