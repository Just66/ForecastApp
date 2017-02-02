//
//  ForescastForFuture.swift
//  Forecast App
//
//  Created by Dmytro Aprelenko on 01.02.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit
import Alamofire


class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: Double!
    var _lowTemp: Double!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    var highTemp: Double {
        if _highTemp == nil {
            _highTemp = 0.0
        }
        return _highTemp
    }
    var lowTemp: Double {
        if _lowTemp == nil {
            _lowTemp = 0.0
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, Any>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, Any> {
            
            if let min = temp["min"] as? Double {
                    let kelvinToCelciusDivision = min - 273.15
                    let kelvinToCelcius = Double(round(10 * kelvinToCelciusDivision/10))
                    self._lowTemp = kelvinToCelcius
            }
            
            if let max = temp["max"] as? Double {
                    let kelvinToCelciusDivision = max - 273.15
                    let kelvinToCelcius = Double(round(10 * kelvinToCelciusDivision/10))
                    self._highTemp = kelvinToCelcius
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, Any>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertDate.dayOfTheWeek()
        }
    }
    
}


extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
}
}
