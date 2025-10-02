### Initial server setup Ubuntu 22.04

- https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-22-04
- https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-22-04#step-4-disabling-password-authentication-on-your-server
- https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-ubuntu-22-04
- https://bobcares.com/blog/fail2ban-unban-ip/

#### Ansible commands
- Encrypt vault
```
ansible-vault encrypt group_vars/all/vault.yml
```

- Edit encrypted vault file
```
ansible-vault edit group_vars/all/vault.yml
```

- Run a playbook with asking vault password
```
ansible-playbook -i inventory --ask-vault-pass playbook.yml
```

- Run a playbook with using vault password from a file
```
ansible-playbook -i inventory.ini --vault-password-file ./vault_password.txt playbook.yml
```
