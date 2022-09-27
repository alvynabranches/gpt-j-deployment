import json
import string
import os
import uvicorn
from fastapi import FastAPI, Request, Response, HTTPException
from datetime import datetime

app = FastAPI()
model_name = "random"

@app.get("/")
async def index():
    # logger.info(f"[{model_name}] Status checked at {datetime.now()}")
    # print(f"[{model_name}] Status checked at {datetime.now()}")
    return Response(json.dumps({"status": "ok"}), 200)


@app.get("/{model_name}")
async def status():
    # logger.info(f"Status of {model_name} checked at {datetime.now()}")
    print(f"Status of {model_name} checked at {datetime.now()}")
    return Response(json.dumps({"status": "ok"}), 201)

if __name__ == "__main__":
    uvicorn.run(
        app, 
        host=os.environ.get("HOST", "0.0.0.0"), 
        port=os.environ.get("PORT", 5000), 
        debug=os.environ.get("DEBUG", True)
    )