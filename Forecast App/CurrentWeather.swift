//
//  CurrentWeather.swift
//  Forecast App
//
//  Created by Dmytro Aprelenko on 30.01.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    var date : String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(compleated: @escaping DownloadComplete) {
        let currentWeather = URL(string: CURRENT_WEATHER_URL)
        Alamofire.request(currentWeather!).responseJSON { response in
            if let JSON = response.result.value {
            if let dict = JSON as? Dictionary<String, Any> {
                if let name = dict["name"] as? String {
                    self._cityName = name
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, Any>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self.weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, Any> {
                    if let currentTemperature = main["temp"] as? Double {
                        let kelvinToCelciusDivision = currentTemperature - 273.15
                        let kelvinToCelcius = Double(round(10 * kelvinToCelciusDivision/10))
                        self._currentTemp = kelvinToCelcius
                        print(self.currentTemp)
                    }
                }
            }
        }
        compleated()
        }
    }
}
