# Ansible jobs

### Playbooks:

* [baseline.yaml](baseline.yaml) configuration

### Vault for secrets

[vault.yaml](group_vars/vault.yaml)
```bash
$ ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt
$ ansible-vault edit vault.yaml
```

### Connectivity tests
```bash
$ ansible all -m ping
$ ansible all -m uptime
$ ansible all -m shell -a "ls -las ~/.ssh/"
```
 
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
  
## Firewall ports

* 3000  gitea 
* 30001 apache httpd

## Users & uids

* 1033 git 
* 1034 httpd

## Groups & gid

* 1033 git 
* 1034 httpd

