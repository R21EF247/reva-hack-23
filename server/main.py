from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

from typing import List
from pydantic import BaseModel

# to handle with _id object in
from bson import json_util

import requests

# dotenv
from dotenv import load_dotenv
import os
load_dotenv()

# mongodb
from pymongo import MongoClient
mongodb_atlas_url="mongodb+srv://pavan:password123%40mongodatabase@cluster0.xwrngu0.mongodb.net"
client=MongoClient(mongodb_atlas_url)


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
    user_collection = client["agrifusion"]["users"]
    result = user_collection.insert_one(user.dict())
    ack = result.acknowledged
    return {"insertion": ack}
    
@app.get("/users")
async def get_users():
    user_collection = client["agrifusion"]["users"]
    data = []
    for document in user_collection.find({}):
        # data.append(document)
        data.append(json_util.dumps(document))
    return data

class Weather(BaseModel):
    lat: float
    lon: float
@app.get("/weather")
async def get_weather(weather: Weather):
    api_key = os.getenv("API_KEY")
    lat=weather.lat
    lon=weather.lon
    url=f"https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={api_key}&units=metric"
    response = requests.get(url)
    data=response.json()  
    desc=data["weather"][0]["description"]
    temp=data["main"]["temp"]
    pressure=data["main"]["pressure"]
    humidity=data["main"]["humidity"]
    visibility=data["visibility"]
    windspeed=data["wind"]["speed"]
    cityName=data["name"]
    country=data["sys"]["country"]
    return {"desc":desc,"temp":temp,"pressure":pressure,"humidity":humidity,"visibility":visibility,"windspeed":windspeed,"cityName":cityName,"country":country}