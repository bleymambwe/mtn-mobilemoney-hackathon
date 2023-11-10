# -*- coding: utf-8 -*-

#!pip freeze > requirements.txt

import os
import pickle
from uvicorn import run
from langchain.llms import OpenAI
from langchain.chat_models import ChatOpenAI
from langchain.prompts import ChatPromptTemplate
from langchain.chains import RetrievalQAWithSourcesChain
from langchain.prompts import HumanMessagePromptTemplate
from langchain.schema.messages import SystemMessage

from dotenv import load_dotenv

from fastapi import FastAPI
#from magnum import Magnum

def configure():
   load_dotenv()
   
configure()

api_key = os.getenv('api_key')
model = os.getenv('model')

def create_llm(api_key,model):
    return ChatOpenAI(model = model,openai_api_key = api_key )

llm = create_llm(api_key = api_key, model = model)

#load embeddings
with open("custom_mtn_data_embeddings.pkl", "rb") as f:
    mtn_vector= pickle.load(f)

chain = RetrievalQAWithSourcesChain.from_llm(llm=llm, retriever=mtn_vector.as_retriever())

def create_chat_template(system_message):
  return ChatPromptTemplate.from_messages(
    [
        SystemMessage(
            content=(system_message)
        ),
        HumanMessagePromptTemplate.from_template("{text}"),
    ]
)

system_message = "You are a helpful mtn mobile money assistant answers questions concerning mtn, mtn mobile money and finacial regulations in Zambia."

chat_template = create_chat_template(system_message)


def MTNllm(text):
  response = llm(chat_template.format_messages(text=text))
  return response.content

app = FastAPI()
#handler = Magnum(app)
   

@app.get("/")
async def process_input():
    return {'hello' :'bley'}


@app.post("/process_input/")
async def process_input(data: dict):
    response = MTNllm(data)
    return response


if __name__ == "__main__":
    # Run the FastAPI application using Uvicorn
   # configure()
    run(app, host="0.0.0.0", port=8000)


