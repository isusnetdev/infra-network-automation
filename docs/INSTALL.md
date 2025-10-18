# Instalação Rápida (POC)

1. Provisionar 3 VMs Ubuntu 24.04: control, git-oxidized, monitoring
2. No control:
   - python3 -m venv ~/ansible-venv
   - source ~/ansible-venv/bin/activate
   - pip install --upgrade pip
   - pip install -r collections-requirements.txt
   - ansible-galaxy collection install -r collections/requirements.yml
   - pip install napalm netmiko ansible-lint yamllint molecule
3. Ajustar inventories/lab/hosts.yml
4. Para Gitea+Oxidized POC:
   - cd docker
   - docker compose -f docker-compose-gitea-oxidized.yml up -d
5. Rodar um playbook de teste:
   - ansible-playbook -i inventories/lab playbooks/backup-configs.yml --check
