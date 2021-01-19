
# Ansible Role: openldap

## Description

Deploys openldap using ansible.

## documentation

## Requirements

## dependecies

* host must belong to inventory group *openldap* with *inventory/group_vars/openldap.yml*
* *dnsmasq* role
* *firewall* role
* *letsencrypt* role
* *packages* role
* *users-and-groups* role

## group_vars, host_vars and vault vars.

| var name                 | var source                        | description                               |
|--------------------------|-----------------------------------|-------------------------------------------|
| _openldap_image_tag      | inventory/group_vars/openldap.yml | docker image tag osixia/openldap:<tag>    |
| _phpldapadmin_image_tag  | inventory/group_vars/openldap.yml | docker image tag osixia/phpldapadmin:<tag>|

## ldap search query

```bash
$ ldapsearch -x -H  ldap://ldap1.bachstraat20.duckdns.org:389 -b dc=bachstraat20,dc=duckdns,dc=org -D "cn=admin,dc=bachstraat20,dc=duckdns,dc=org" -w $ADMINPASSWORD
$ ldapsearch -x -H ldaps://ldap1.bachstraat20.duckdns.org:636 -b dc=bachstraat20,dc=duckdns,dc=org -D "cn=admin,dc=bachstraat20,dc=duckdns,dc=org" -w $ADMINPASSWORD
$ ldapsearch -x -LLL -b ou=groups,dc=bachstraat20,dc=duckdns,dc=org  "(cn=linuxusers)"  -D "cn=admin,dc=bachstraat20,dc=duckdns,dc=org" -w $ADMINPASSWORD  
$ ldapsearch -x -LLL -b  ou=users,dc=bachstraat20,dc=duckdns,dc=org  "(uid=ted.sluis)"  -D "cn=admin,dc=bachstraat20,dc=duckdns,dc=org" -w $ADMINPASSWORD  
$ ldapsearch -x -LLL -b           dc=bachstraat20,dc=duckdns,dc=org  "(ou=linuxadmins)" -D "cn=admin,dc=bachstraat20,dc=duckdns,dc=org" -w $ADMINPASSWORD  
```

