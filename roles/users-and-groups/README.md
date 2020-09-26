# users and groups

## description

Gether and merge user and group propperties from  _\<somename\>_users and _\<somename\>_groups variables from the *host_var* and *group_vars* of a host and configure them.

## group_vars en host_vars

| var name         | var type                            | description                              |
|------------------|-------------------------------------|------------------------------------------|
| _somename_groups | inventory/group_vars/somegroup.yml  | group settings for some group, see below |
| _somename_groups | inventory/hostvar_vars/somehost.yml | group settings for some host, see below  |
| _somename_users  | inventory/group_vars/somegroup.yml  | user settings for some group, see below  |
| _somename_users  | inventory/hostvar_vars/somehost.yml | user settings for some host, see below   |


```bash
_somename_users:
  - { user: '<some username>',comment: '<description>',uid: '<uid>',groups: '<group name>',create_home: 'false',shell: '/bin/nologin' 
  - { user: '<some username>',comment: '<description>',uid: '<uid>',groups: '<group name>',create_home: 'true',shell: '/bin/bash' 
```

```bash
_somename_groups:
  - { group: '<some groupname>',gid: '<gid>' }
  - { group: '<some groupname>',gid: '<gid>' }
```
