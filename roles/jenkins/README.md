
# Ansible Role: jenkins

## Description

Deploys jenkins using ansible.

* supports https (default port 443)

## documentation

* https://www.jenkins.io/
* https://github.com/jenkinsci/docker/blob/master/README.md
* https://hub.docker.com/r/jenkins/jenkins


## dependecies

* host must belong to inventory group *jenkins* with *inventory/group_vars/jenkins.yml*
* *dnsmasq* role
* *firewall* role
* *letsencrypt* role
* *packages* role
* *users-and-groups* role

## varibles

default variable values can be found in [defaults/main.yml](defaults/main.yml)

| var name                        | var source                           | description                    |
|---------------------------------|--------------------------------------|--------------------------------|
| _jenkins_user                   | inventory/group_vars/jenkins.yml     | jenkins admin user             |
| _jenkins_password               | inventory/group_vars/jenkins.yml     | encrypted jenkins password     |
| _jenkins_passphrase             | inventory/group_vars/jenkins.yml     | encrypted grafana passphrase   |
| _jenkins_image_tag              | inventory/group_vars/jenkins.yml     | docker image tag               |
| _jenkins_fqdn                   | inventory/group_vars/jenkins.yml     | jenkins hostname               |
| _jenkins_plugins                | inventory/group_vars/jenkins.yml     | list of jenkins plugins        |
| _letsencrypt_inventory_hostname | inventory/group_vars/letsencrypt.yml | Letsencrypt inventory hostname |

