# playbooks for fedora on raspberry pi

## Scope

* raspberry 2b, 3b, 3b+, 4b-4gb, 4b-8gb
* fedora 32
* ansible & ansible-vault


## Playbooks:

| playbooks                          | description                        |
|------------------------------------|------------------------------------|
| [provision.yaml](provision.yaml)   | all roles -- full stack deployment |
| [baseline.yaml](baseline.yaml)     | baseline features                  |
| [gitea.yaml](gitea.yaml)           | git server deployment              |
| [httpd.yaml](httpd.yaml)           | apache server deployment           |
| [pihole.yaml](pihole.yaml)         | pihole server deployment           |
| [postgres.yaml](postgres.yaml)     | postgres db deployment             |
| [rocketchat.yaml](rocketchat.yaml) | rocketchat server deployment       |


## Inventory

| inventory files and directories                                    | decription         |
|--------------------------------------------------------------------|--------------------|
| [inventory/all](inventory/all)                                     | main group         |
| [inventory/host_vars/](inventory/host_vars/)                       | host files         |
| [inventory/group_vars/](inventory/group_vars/)                     | group files        |
| [inventory/group_vars/vault.yaml](inventory/group_vars/vault.yaml) | ansible vault file |


To open ansible vault, store password in file and add environment variable to .bashrc:
```bash
$ ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt
```


## Roles

| roles                                            | readme                                                               | group_vars                                                                     |
|--------------------------------------------------|----------------------------------------------------------------------|--------------------------------------------------------------------------------|
| [roles/baseline](roles/baseline)                 | [roles/baseline/README.md](roles/baseline/README.md)                 |                                                                                |
| [roles/dnsmasq](roles/dnsmasq)                   | [roles/dnsmasq/README.md](roles/dnsmasq/README.md)                   |                                                                                |
| [roles/firewall](roles/firewall)                 | [roles/firewall/README.md](roles/firewall/README.md)                 |                                                                                |
| [roles/gitea](roles/gitea)                       | [roles/gitea/README.md](roles/gitea/README.md)                       | [inventory/group_vars/gitea.yml](inventory/group_vars/gitea.yml)               |
| [roles/httpd](roles/httpd)                       | [roles/httpd/README.md](roles/httpd/README.md)                       | [inventory/group_vars/httpd.yml](inventory/group_vars/httpd.yml)               |
| [roles/letsencrypt](roles/letsencrypt)           | [roles/letsencrypt/README.md](roles/letsencrypt/README.md)           | [inventory/group_vars/letsencrypt.yml](inventory/group_vars/letsencrypt.yml)   |
| [roles/packages](roles/packages)                 | [roles/packages/README.md](roles/packages/README.md)                 |                                                                                |
| [roles/pihole](roles/pihole)                     | [roles/pihole/README.md](roles/pihole/README.md)                     | [inventory/group_vars/pihole.yml](inventory/group_vars/pihole.yml)             |
| [roles/postgres](roles/postgres)                 | [roles/postgres/README.md](roles/postgres/README.md)                 | [inventory/group_vars/postgres.yml](inventory/group_vars/postgres.yml)         |
| [roles/rocketchat](roles/rocketchat)             | [roles/rocketchat/README.md](roles/rocketchat/README.md)             | [inventory/group_vars/rocketchet.yml](inventory/group_vars/rocketchat.yml)     |
| [roles/users-and-groups](roles/users-and-groups) | [roles/users-and-groups/README.md](roles/users-and-groups/README.md) |                                                                                |


## Firewall ports
<details>
<summary>firewall ports</summary>

| port  | service            |
|-------|--------------------|
| 22    | ssh                |
| 3000  | gitea              |
| 5432  | postgres default   |
| 30080 | apache httpd http  |
| 30443 | apache httpd https |
| 31080 | apache httpd http  |
| 31433 | apache httpd https |

</details>

## Users, uids and groups, guids
<details>
<summary>users and groups</summary>

| uid  | user        | guid | group       |
|------|-------------|------|-------------|
| 1033 | gitea       | 1033 | gitea       |
| 1034 | httpd       | 1034 | httpd       |
| 1035 | letsencrypt | 1035 | letsencrypt |
| 1036 | postgres    | 1036 | postgres    |

</details>

## more......

https://github.com/dysosmus/ansible-completion
```bash
$ git clone git@github.com:dysosmus/ansible-completion.git
$ cd ansible-completion
$ sudo cp *.bash /etc/bash_completion.d/
```
Reload shell: *source ~/.bashrc* or *source ~/.profile*
  
## Install VIM plugin manager
https://github.com/junegunn/vim-plug
```bash
$ mkdir -p ~/.vim/autoload

$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
  
## Install VIM syntax highlighting plugin for Ansible
https://github.com/pearofducks/ansible-vim
```bash
$ cat <<EOT >> ~/.vimrc 
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'pearofducks/ansible-vim'
  
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
EOT
```
To update the plug-ins, use *:PlugUpdate* in VIM.
  

