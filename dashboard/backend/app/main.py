from fastapi import FastAPI
app = FastAPI(title='Network Automation Dashboard - POC')

@app.get('/health')
async def health():
    return {'status': 'ok'}

@app.get('/backups/{device}')
async def get_backup(device: str):
    # placeholder: integrate with Oxidized/Git
    return {'device': device, 'last_backup': '2025-10-15T12:34:00Z'}
