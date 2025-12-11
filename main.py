from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class InputModel(BaseModel):
    email_folder: str

@app.get("/")
def home():
    return {"message": "Backend is running 🚀"}

@app.post("/reconstruct")
def reconstruct(req: InputModel):
    return {
        "status": "received",
        "email_folder": req.email_folder
    }
