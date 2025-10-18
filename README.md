# Network Automation - Multi-Vendor Skeleton

Este repositório é um esqueleto para o projeto de automação de configuração e backups de dispositivos de rede (multi-vendor).
Contém exemplos mínimos de playbooks, roles, templates por vendor, CI (Semaphore) e um esqueleto de dashboard (FastAPI + React).

## Estrutura
- `collections/requirements.yml` - collections recomendadas para instalar no control node
- `inventories/` - inventories de `lab` e `production`
- `playbooks/` - playbooks principais (`backup-configs.yml`, `push-config.yml`, `compliance-check.yml`)
- `roles/` - roles (e.g. `backup`, `acl`, `base`) com templates por vendor
- `ci/` - exemplo de pipeline do Semaphore
- `docker/` - docker-compose exemplos para Gitea + Oxidized (POC)
- `dashboard/` - esqueleto do FastAPI backend e React frontend

## Como usar (rápido)
1. Instale collections:
   ```
   ansible-galaxy collection install -r collections/requirements.yml
   pip install napalm netmiko
   ```
2. Ajuste `inventories/lab/hosts.yml` com IPs dos seus dispositivos/simuladores.
3. Execute playbooks localmente (sempre testar com `--check`):
   ```
   ansible-playbook -i inventories/lab playbooks/backup-configs.yml --check
   ```

Veja `docs/` para mais detalhes (expandir conforme necessário).
