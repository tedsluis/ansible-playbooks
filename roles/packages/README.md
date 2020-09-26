# packages

## description

Gether and merge packages from  _\<somename\>_packages variables from the *host_var* and *group_vars* to install on a host.

## group_vars en host_vars

| var name           | var type                            | description                             |
|--------------------|-------------------------------------|-----------------------------------------|
| _somename_packages | inventory/group_vars/somegroup.yml  | packages needed for a group, see below  |
| _somename_packages | inventory/hostvar_vars/somehost.yml | packages needed for a host, se below    |


```bash
_somename_packages:
  - <package>
  - <package>
  - <package>
```
