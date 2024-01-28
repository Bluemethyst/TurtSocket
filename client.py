import aiohttp
import asyncio
from concurrent.futures import ThreadPoolExecutor
import json

async def receiver(ws):
    async for msg in ws:
        try:
            data = json.loads(msg.data)
            print(f"Received: {json.dumps(data, indent=4)}")
        except json.JSONDecodeError:
            pass
            
            
async def client():
    uri = "ws://localhost:2024"
    async with aiohttp.ClientSession() as session:
        async with session.ws_connect(uri) as ws:
            receiver_task = asyncio.create_task(receiver(ws))
            executor = ThreadPoolExecutor(max_workers=1)
            while True:
                loop = asyncio.get_event_loop()
                message = await loop.run_in_executor(executor, input)
                await ws.send_str(message)
            receiver_task.cancel()

try:
    asyncio.run(client())
except KeyboardInterrupt:
    print("\nProgram terminated by user.")