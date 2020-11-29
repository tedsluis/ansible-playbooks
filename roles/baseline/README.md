# Ansible Role: baseline

## Description

Deploys baseline configuration using ansible.

* aliasses to .bashrc
* bash completion and vim syntax highlighting for ansible
* systemd cronjob to update packages
* git settings
* /etc/hosts
* locale settings
* mail settings
* motd login page
* command prompt with git info
* raspberry config settings
* ssh agent
* timezone
* tmux settings
* vim settings

## Requirements

- gmail authentication token

## dependecies

* host must belong to inventory group *alertmanager* with *inventory/group_vars/alertmanager.yml*
* *packages* role
* *users-and-groups* role

## varibles

default variable values can be found in [defaults/main.yml](defaults/main.yml)

| var name                   | var source                      | description                              |
|----------------------------|---------------------------------|------------------------------------------|
| _accounts                  | inventory/group_vars/all.yml    | list of account                          |
| _etc_vimrc                 | inventory/group_vars/all.yml    | path/file vimrc                          |
| _git_username              | inventory/group_vars/all.yml    | account git user                         |
| _git_mail_address          | inventory/group_vars/all.yml    | email address git user                   |
| _raspi_configtxt           | inventory/group_vars/all.yml    | raspberry config file                    |
| _mail_hubhost              | inventory/group_vars/all.yml    | smtp host                                |
| _mail_hubport              | inventory/group_vars/all.yml    | smtp port                                |
| _mail_address              | inventory/group_vars/all.yml    | email address                            |
| _mail_password             | inventory/group_vars/all.yml    | mail password                            |
| _tls_ca_file               | inventory/group_vars/all.yml    | path to ca file                          |
| _timezone                  | inventory/group_vars/all.yml    | timezone                                 |
| _wants_crontab             | inventory/group_vars/all.yml    | enable cron jobs                         |
| _wants_git                 | inventory/group_vars/all.yml    | enable git settings                      |
| _wants_ansible             | inventory/group_vars/all.yml    | enable ansible settings                  |
| _wants_sshagent            | inventory/group_vars/all.yml    | enable sshagent settings                 |
