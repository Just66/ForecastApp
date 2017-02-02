//
//  Location.swift
//  Forecast App
//
//  Created by Dmytro Aprelenko on 02.02.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longtitude: Double!
}
