//
//  Constants.swift
//  Forecast App
//
//  Created by Dmytro Aprelenko on 29.01.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import Foundation

let CURRENT_SIT_URL = "http://api.openweathermap.org/data/2.5/weather?"
let FUTURE_SIT_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE = "lat=\(Location.sharedInstance.latitude!)"
let LONGTITUDE = "&lon=\(Location.sharedInstance.longtitude!)"
let APP_ID = "&appid="
let API_KEY = "764efdc739e3618b7c38bfadb6f3401a"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(CURRENT_SIT_URL)\(LATITUDE)\(LONGTITUDE)\(APP_ID)\(API_KEY)"
let FORECAST_WEATHERA_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longtitude!)&cnt=10&mode=json&appid=764efdc739e3618b7c38bfadb6f3401a"
