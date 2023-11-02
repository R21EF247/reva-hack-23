from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

from typing import List
from pydantic import BaseModel

# Static files
from fastapi.staticfiles import StaticFiles

# middlewares
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()


# cors
origins = [
   "http://192.168.211.:8000",
   "http://localhost",
   "http://localhost:8080",
]
app.add_middleware(
   CORSMiddleware,
   allow_origins=origins,
   allow_credentials=True,
   allow_methods=["*"],
   allow_headers=["*"],
)

# Mount the static directory
app.mount("/static", StaticFiles(directory="static"), name="static")
# /static/filename

templates = Jinja2Templates(directory="templates")

@app.get("/", response_class=HTMLResponse)
async def read_root(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})

# Users Creation and fetching
users=[]

class User(BaseModel):
    name: str
    lat: float
    lon: float
    phone: str
    
@app.post("/user")
async def create_user(user: User):
    users.append(user)
    print(users)
    return user
    # return {"message": "User created successfully"}
    
@app.get("/users")
async def get_users():
    return users    