#!/usr/bin/bash
adduser tedsluis
passwd tedsluis
adduser ansible
passwd ansible
mkdir /home/tedsluis/.ssh
mkdir /home/ansible/.ssh
cp /root/.ssh/authorized_keys /home/tedsluis/.ssh
cp /root/.ssh/authorized_keys /home/ansible/.ssh
chmod 640 /home/tedsluis/.ssh/authorized_keys
chmod 640 /home/ansible/.ssh/authorized_keys
chmod 700 /home/tedsluis/.ssh
chmod 700 /home/ansible/.ssh
chown tedsluis:tedsluis -R /home/tedsluis/.ssh
chown ansible:ansible -R /home/ansible/.ssh
usermod -a -G wheel tedsluis
usermod -a -G wheel ansible
sed -r 's/^(%wheel\s+ALL=\(ALL\)\s+ALL\s*)$/##\1/' -i /etc/sudoers
sed -r 's/^#\s*(%wheel\s+ALL=\(ALL\)\s+NOPASSWD:\s+ALL\s*)$/\1/' -i /etc/sudoers 

