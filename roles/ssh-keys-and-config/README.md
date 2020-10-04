# ssh keys and ssh config

## description

Gether and merge host ssh keys and config propperties from  _\<somename\>_sshkeys variables from the *host_var* and *group_vars* to add ssh keys and configure it's ssh config.

## group_vars en host_vars

| var name              | var type                            | description                              |
|-----------------------|-------------------------------------|------------------------------------------|
| _somename_sshkeys     | inventory/group_vars/somegroup.yml  | ssh keys and config settings for a group |
| _somename_sshkeys     | inventory/hostvar_vars/somehost.yml | ssh keys and config settings for a host  |
| _id_rsa (example)     | inventory/group_var/vault.yml       | private key in vault, see below key_var  |
| _id_rsa_pub (example) |inventory/group_var/vault.yml        | pubic key in vault, see below key_var    |


```bash
_somename_sshkeys:
  - { key_name: 'id_rsa.pub', key_type: 'public_key',     key_var: '_id_rsa_pub', owner: 'tedsluis',  group: 'tedsluis' }
  - { key_name: 'id_rsa.pub', key_type: 'authorized_key', key_var: '_id_rsa_pub', owner: 'tedsluis',  group: 'tedsluis' }
  - { key_name: 'id_rsa',     key_type: 'private_key',    key_var: '_id_rsa',     owner: 'tedsluis',  group: 'tedsluis', ssh_user: '*',        ssh_hostname: 'git.bachstraat20.duckdns.org' }
  - { key_name: 'id_rsa',     key_type: 'private_key',    key_var: '_id_rsa',     owner: 'tedsluis',  group: 'tedsluis', ssh_user: 'tedsluis', ssh_hostname: 'github.com' }
```


| key_type      | file mode | behavior                                                        |
|---------------|-----------|-----------------------------------------------------------------|
| public_key    | 0644      | will be stored in ~/.ssh/                                       |
| private_key   | 0600      | will be stored in ~/.ssh/ and can be configured in ~/ssh/config |
|authorized_key | 0644      | will be added to ~/.ssh/authorized_keys                         |

note: 

* *key_var* stores the ansible vault variable name were that password can be found.

