#!/usr/bin/env python3

import os
import telebot
import open_weather_api

TOKEN = os.environ.get('TOKEN_TELEGRAM')
weatherApiKey = os.environ.get('TOKEN_API_WEATH')

bot = telebot.TeleBot(TOKEN)

@bot.message_handler(commands=['start'])
def start(m):
    bot.send_message(m.chat.id, "Здарова кожанный! Используй /weather для запроса погоды.")
    
@bot.message_handler(commands=['weather']) 
def weather(m):
    bot.send_message(m.chat.id, "В каком городе хочешь узнать погоду, кожанный?") 
    
@bot.message_handler(content_types=["text"])
def handle_text(message):
    city = message.text.strip() 
    print(city) 
    answer_json = open_weather_api.getWeather(city, weatherApiKey)
    answer = f'Погода в городе {answer_json["city"]}, feels_like: {answer_json["feels_like"]}'
    bot.send_message(message.chat.id, answer)

bot.infinity_polling()