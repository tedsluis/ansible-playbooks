# postgres

## description
Deploys a postgres container:

* persistent storage mount /var/lib/postgres-\<instancename\>/
* expose port (default 5432) in podman network
* postgres user and password from vault (default is postgres/postgres)
* creates database (default is postgres)

## documentation

* https://github.com/docker-library/postgres
* https://hub.docker.com/_/postgres

## dependecies

* host must belongs to inventory group *postgres* with *inventory/group_vars/postgres.yml*
* *dnsmask*
* *users-and-groups* role
* *packages* role

## group_vars, host_vars and vault vars.

| var name                        | var type                            | description                               |
|---------------------------------|-------------------------------------|-------------------------------------------|
| _postgres_image_tag             | inventory/group_vars/postgres.yml   | docker image tag postgres:<tag>           |
| _postgres_instance              | inventory/hostvar_vars/somehost.yml | postgress instance propperties, see below |
| _postgress_password_someuser    | inventory/group_vars/vault.yml      | postgres password someuser                |

```bash
_postgres_instance:
  - { name: '<some instance name>', port: '5432', podman_network: '<somename>', dbname: 'some db name', password_var: '_postgress_password_someuser' }
```

notes: 

* *password_var* stores the ansible vault variable name were that password can be found.
* the port is only exposed in the podman network, not outside the host.
