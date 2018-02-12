#!/usr/bin/env bash

# force the re-installation of OLA using the force_reinstall_ola variable
#ansible-playbook complete_playbook.yml -i inventory.dist --ask-vault-pass --extra-vars "force_reinstall_ola=true" --timeout=30
#ansible-playbook complete_playbook.yml -i inventory.dist --ask-vault-pass --timeout=30
g tim
ansible-playbook complete_playbook.yml -i inventory.dist --vault-password-file=passwd --timeout=30
