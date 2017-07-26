#!/usr/bin/env bash

# force the re-installation of OLA using the force_reinstall_ola variable
#ansible-playbook complete_playbook.yml -i inventory.dist --ask-vault-pass --extra-vars "force_reinstall_ola=true"

ansible-playbook complete_playbook.yml -i inventory.dist --ask-vault-pass