# Ansible jobs

## My playbooks:

* [Baseline](baseline.yaml) for armbian, centos, debian, fedora and raspbian.
* [Homeassistant check](check_homeassistant.yaml) deployment.
* [Reboot](reboot.yaml) hosts.
* [zigbee2mqtt assistant](start_zigbee2mqtt_assistant.yaml).
* [Deploy kubernetes on raspberry](k8s.yaml).

## My Ansible secrets

/home/tedsluis/.ansible_secrets.yaml

* emailpassword
* sonoff_password
* Z2MA_SETTINGS__MQTTPASSWORD


## Connectivity tests
```bash
$ ansible all -a "/bin/echo hello"
$ ansible all -m ping
$ ansible all -a uptime
$ ansible all -a "ls -las ~/.ssh/"
```

## Create new roles
https://galaxy.ansible.com/docs/contributing/creating_role.html
```bash
$ ansible-galaxy init  --init-path=roles/ -v ROLENAME
```
 
## Ansible docs
https://www.ansible.com/hubfs/2018_Content/AA%20BOS%202018%20Slides/Ansible%20Best%20Practices.pdf
  
## Add bash completion for Ansible
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
  
## Debug task
https://docs.ansible.com/ansible/latest/modules/debug_module.html
```yaml
- debug:
    msg: "This always displays"
- debug:
    msg: "This only displays with ansible-playbook -vv+"
    verbosity: 2
```
  
## Smoke test
https://docs.ansible.com/ansible/latest/modules/uri_module.html
```yaml
- name: Some smoke test
  hosts: localhost
  connection: local
  become: no

  tasks:
    - block:
        - name: Test uri module.
          uri:
            url: "http://localhost:80/"
            return_content: yes
            status_code: 401
            validate_certs: no
          register: result
          run_once: true
          until: not result.failed
          retries: 100
          delay: 3
      always:
        - debug:
            var: result
```
 
