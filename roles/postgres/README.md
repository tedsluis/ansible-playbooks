# postgres

## documentation

* https://github.com/docker-library/postgres
* https://hub.docker.com/_/postgres

## dependecies

* host belongs to inventory group *postgres* with *inventory/group_vars/postgres.yml*
* role *dnsmask*

## vars 

| var                         | source                              | description                             |
|-----------------------------|-------------------------------------|-----------------------------------------|
| _postgres_image_tag         | inventory/group_vars/postgres.yml   | docker image tag postgres:<tag>         |
| _postgres_instance.name     | inventory/hostvar_vars/somehost.yml | postgress instance name                 |
| _postgres_instance.port     | inventory/hostvar_vars/somehost.yml | port exposed in podman network          |
| _postgres_instance.network  | inventory/hostvar_vars/somehost.yml | podman network name                     |
| _postgres_instance.user     | inventory/hostvar_vars/somehost.yml | postgres user                           |
| _postgres_instance.dbname   | inventory/hostvar_vars/somehost.yml | postgres database name                  |
| _postgres_instance.password | inventory/hostvar_vars/somehost.yml | postgres password variable in vault     |
| _postgress_someuser         | inventory/group_vars/vault.yml      | postgres password someuser              |

