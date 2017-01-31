//
//  Constants.swift
//  Forecast App
//
//  Created by Dmytro Aprelenko on 29.01.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGTITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "764efdc739e3618b7c38bfadb6f3401a"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-45\(LONGTITUDE)71.51\(APP_ID)\(API_KEY)"
