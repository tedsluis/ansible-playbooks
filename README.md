# playbooks for fedora on raspberry pi

## Scope

* raspberry 2b, 3b, 3b+, 4b-4gb, 4b-8gb, Lenovo Thinkpad T580, Intel Nuc
* fedora 32, 33, 34
* ansible & ansible-vault

## what runs where

| fed127  | fed130  | fed143      | fed149       | fed157           | fed159     | fed160        | fed168   | fed171     | fed178           | openvpn         | pihole  | 
| rpi4b8g | rpi4b8g | rpi4b4g     | rpi4b4g      | rpi3b+           | rpi2b      | rpi4b8g       | rpi4b8g  | rpi2b      | rpi2b            | rpi3b           | rpi3b   |
| nvme128 | nvme128 | nvme512     | nvme1024     |                  |            | nvme128       |          |            |                  |                 |         |
| f34     | f34     | f34         | f34          | f34              |            | f34           | f34      |            |                  |                 |         |
|---------|---------|-------------|--------------|------------------|------------|---------------|----------|------------|------------------|-----------------|---------|
|         | jenkins | gitea       | build-images | piaware          | haproxy    | alert manager | awx      | haproxy    | piaware          | openvpn         | pihole  |
|         |         | httpd       | get-images   | dump1090exporter | keepalived | blackbox      | linkding | keepalived | dump1090exporter | openvpnexporter |         |
|         |         | letsencrypt | nfsserver    |                  |            | grafana       | openldap |            |                  |                 |         |
|         |         | postgres    | openldap     |                  |            | karma         |          |            |                  |                 |         |
|         |         |             | registry     |                  |            | prometheus    |          |            |                  |                 |         |
|         |         |             |              |                  |            | snmpexporter  |          |            |                  |                 |         |
|         |         |             |              |                  |            |               |          |            |                  |                 |         |

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

## encrypted varibles

To decrypt ansible encrypted variables, store the password in file and add environment variable to .bashrc:
```bash
$ ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt
```

create encrypted variable
```bash
$ ansible-vault encrypt_string  'SECRET' --name '_slack_webhook_secret'
```

show encrypted variable
```bash
$ ansible -i "localhost," all  -m debug -a 'msg="{{ _slack_webhook_secret }}"'  -e@roles/alertmanager/defaults/main.yml
```

## dependicies

```bash
$ ansible-galaxy collection install community.general
$ ansible-galaxy collection install containers.podman
$ sudo dnf install python3-pip
$ sudo pip3 install virtualenv
$ virtualenv venv
$ source venv/bin/activate          # deactivate to exit
$ virtualenv -p python3 myenv
$ pip install ansible
```


## Roles

| roles                                      | readme                                          | inventory/group_vars/                                     |
|--------------------------------------------|-------------------------------------------------|-----------------------------------------------------------|
| [baseline](roles/baseline)                 | [README.md](roles/baseline/README.md)           |                                                           |
| [dnsmasq](roles/dnsmasq)                   | [README.md](roles/dnsmasq/README.md)            |                                                           |
| [firewall](roles/firewall)                 | [README.md](roles/firewall/README.md)           |                                                           |
| [gitea](roles/gitea)                       | [README.md](roles/gitea/README.md)              | [gitea.yml](inventory/group_vars/gitea.yml)               |
| [httpd](roles/httpd)                       | [README.md](roles/httpd/README.md)              | [httpd.yml](inventory/group_vars/httpd.yml)               |
| [letsencrypt](roles/letsencrypt)           | [README.md](roles/letsencrypt/README.md)        | [letsencrypt.yml](inventory/group_vars/letsencrypt.yml)   |
| [packages](roles/packages)                 | [README.md](roles/packages/README.md)           |                                                           |
| [pihole](roles/pihole)                     | [README.md](roles/pihole/README.md)             | [pihole.yml](inventory/group_vars/pihole.yml)             |
| [postgres](roles/postgres)                 | [README.md](roles/postgres/README.md)           | [postgres.yml](inventory/group_vars/postgres.yml)         |
| [rocketchat](roles/rocketchat)             | [README.md](roles/rocketchat/README.md)         | [rocketchet.yml](inventory/group_vars/rocketchat.yml)     |
| [ssh-keys-and-config](ssh-keys-and-config) | [README.md](roles/ssh-keys-and-config/README.md)|                                                           |
| [users-and-groups](roles/users-and-groups) | [README.md](roles/users-and-groups/README.md)   |                                                           |


## Used port, users, groups

<details>
<summary>firewall ports</summary>

| port  | service            | scope                 |
|-------|--------------------|-----------------------|
| 22    | ssh                | all hosts             |
| 53    | dns                  pihole                |
| 80    | http               | pihole                |
| 443   | https              | pihole                |
| 2222  | gitea ssh          | gitea                 |
| 3000  | gitea              | gitea                 |
| 5432  | postgres default   | inside podman network |
| 30080 | apache httpd http  | on host fed143        |
| 30443 | apache httpd https | on host fed143        |
| 31080 | apache httpd http  | on host fed143        |
| 31433 | apache httpd https | on host fed143        |

</details>
<details>
<summary>users and groups</summary>

| uid  | user        | guid | group       |
|------|-------------|------|-------------|
| 1000 | tedsluis    | 1000 | tedsluis    |
| 1000 | pi          | 1000 | pi          |
| 1001 | ansible     | 1001 | ansible     |
| 1033 | gitea       | 1033 | gitea       |
| 1034 | httpd       | 1034 | httpd       |
| 1035 | letsencrypt | 1035 | letsencrypt |
| 1036 | postgres    | 1036 | postgres    |

</details>

## Prepare raspberry firmware for mass storage usb storage

Boot with raspios image and perform a full-upgrade.
Specificy *beta*, *critical* or *stable* in the file below:
```bash
pi@raspberrypi:~ $ sudo vi /etc/default/rpi-eeprom-update
```
Check for updates:
```bash
pi@raspberrypi:i~ $ sudo rpi-eeprom-update 
BCM2711 detected
VL805 firmware in bootloader EEPROM
*** UPDATE AVAILABLE ***
BOOTLOADER: update available
CURRENT: Thu  3 Sep 12:11:43 UTC 2020 (1599135103)
 LATEST: Wed 28 Oct 17:32:40 UTC 2020 (1603906360)
 FW DIR: /lib/firmware/raspberrypi/bootloader/beta
VL805: up-to-date
CURRENT: 000138a1
 LATEST: 000138a1
```
Apply update:
```bash
pi@raspberrypi:/lib/firmware/raspberrypi/bootloader/beta $ sudo rpi-eeprom-update -a
BCM2711 detected
VL805 firmware in bootloader EEPROM
*** INSTALLING EEPROM UPDATES ***
BOOTLOADER: update available
CURRENT: Thu  3 Sep 12:11:43 UTC 2020 (1599135103)
 LATEST: Wed 28 Oct 17:32:40 UTC 2020 (1603906360)
 FW DIR: /lib/firmware/raspberrypi/bootloader/beta
VL805: up-to-date
CURRENT: 000138a1
 LATEST: 000138a1
BOOTFS /boot
EEPROM updates pending. Please reboot to apply the update.
```
Reboot en login again.

Select a eeprom version:
```bash
pi@raspberrypi:~ $ cp /lib/firmware/raspberrypi/bootloader/critical/pieeprom-2020-09-03.bin .
```
Or download one from github:
```bash
pi@raspberry:~ $ wget https://github.com/raspberrypi/rpi-eeprom/raw/master/firmware/beta/pieeprom-2020-10-28.bin
```
List versions:
```bash
pi@raspberrypi:~ $ ls -l 
total 1540
-rw-r--r-- 1 pi pi 524288 Oct 30 15:22 pieeprom-2020-09-03.bin
-rw-r--r-- 1 pi pi 524288 Oct 30 10:49 pieeprom-2020-10-28.bin
```
Get boot config settings from eeprom:
```bash
pi@raspberrypi:~ $ rpi-eeprom-config pieeprom-2020-09-03.bin > bootconf.txt
```
Show boot config settings:
```bash
pi@raspberrypi:~ $ cat bootconf.txt
[all]
BOOT_UART=0
WAKE_ON_GPIO=1
POWER_OFF_ON_HALT=0
DHCP_TIMEOUT=45000
DHCP_REQ_TIMEOUT=4000
TFTP_FILE_TIMEOUT=30000
ENABLE_SELF_UPDATE=1
DISABLE_HDMI=0
BOOT_ORDER=0xf41
```
Edit boot config settings:
```bash
pi@raspberrypi:~ $ vi bootconf.txt
```
Create new eeprom with boot config settings:
```bash
pi@raspberrypi:~ $ rpi-eeprom-config --out pieeprom-new.bin --config bootconf.txt pieeprom-2020-09-03.bin 
```
Show new eeprom + boot settings:
```
pi@raspberrypi:~ $ ls -l 
total 1540
-rw-r--r-- 1 pi pi    278 Oct 30 15:21 bootconf.txt
-rw-r--r-- 1 pi pi 524288 Oct 30 15:22 pieeprom-2020-09-03.bin
-rw-r--r-- 1 pi pi 524288 Oct 30 10:49 pieeprom-2020-10-28.bin
-rw-r--r-- 1 pi pi 524288 Oct 30 14:45 pieeprom-new.bin
```
Apply eeprom + boot settings:
```bash
pi@raspberrypi:~ $ sudo rpi-eeprom-update -d -f ./pieeprom-new.bin
BCM2711 detected
VL805 firmware in bootloader EEPROM
*** INSTALLING ./pieeprom-new.bin  ***
BOOTFS /boot
EEPROM update pending. Please reboot to apply the update.
```
Reboot raspberry to apply update and login again.

Show new boot config settings:
```bash
pi@raspberrypi:~ $ vcgencmd bootloader_config
[all]
BOOT_UART=0
WAKE_ON_GPIO=1
POWER_OFF_ON_HALT=0
DHCP_TIMEOUT=45000
DHCP_REQ_TIMEOUT=4000
TFTP_FILE_TIMEOUT=30000
TFTP_IP=
TFTP_PREFIX=0
BOOT_ORDER=0xf41               <------ boot order is sdcard, usb mass storage
SD_BOOT_MAX_RETRIES=3
NET_BOOT_MAX_RETRIES=5
USB_MSD_PWR_OFF_TIME=0
USB_MSD_DISCOVER_TIMEOUT=20
[none]
FREEZE_VERSION=0
```

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
  

