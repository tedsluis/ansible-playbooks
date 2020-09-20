# Httpd apache

## documentation

* https://github.com/apache/httpd
* https://hub.docker.com/_/httpd

## dependecies

* host belongs to inventory group *httpd* with *inventory/group_vars/httpd.yml*

## vars 

| var                    | source                           | description                             |
|------------------------|----------------------------------|-----------------------------------------|
| _httpd_image_tag       | inventory/group_vars/httpd.yml   | docker image tag httpd:<tag>            |
| _httpd_users           | inventory/group_vars/httpd.yml   | uid/gid used to run container           |


