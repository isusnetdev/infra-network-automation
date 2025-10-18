# Collections recomendadas

Instale as collections listadas em `collections/requirements.yml`:
```
ansible-galaxy collection install -r collections/requirements.yml
pip install napalm netmiko
```

As collections contêm módulos oficiais e community para interagir com diversos vendors:
- Fortinet: fortinet.fortios
- Palo Alto: paloaltonetworks.panos
- HPE/Aruba: arubanetworks.aoscx
- Huawei: community.network (CloudEngine modules)
- F5: f5networks.f5_modules
- Juniper: juniper.device
