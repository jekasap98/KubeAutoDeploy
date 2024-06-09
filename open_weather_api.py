#!/usr/bin/env python3

import os
import urllib.request
import json
import urllib.parse

def getWeather(city, apiKey):
    city_encoded = urllib.parse.quote(city, encoding='UTF-8')
    url = f"https://api.openweathermap.org/data/2.5/weather?q={city_encoded}&appId={apiKey}&units=metric&lang=ru"
    with urllib.request.urlopen(url) as result:
        weatherJson = json.loads(result.read())
        return {
            "city": city,
            "feels_like": weatherJson["main"]["feels_like"],
            "wind_speed": weatherJson["wind"]["speed"],
        }

if __name__ == "__main__":
    city = "Minsk"
    apiKey = os.environ.get('WEATHER_API_KEY')
    weatherData = getWeather(city, apiKey)
    print(weatherData)


