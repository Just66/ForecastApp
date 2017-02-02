//
//  WeatherCell.swift
//  Forecast App
//
//  Created by Dmytro Aprelenko on 02.02.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var dayOftheWeekLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func congigureCell(forecast: Forecast) {
        minTempLabel.text = "\(forecast.lowTemp)"
        maxTempLabel.text = "\(forecast._highTemp)"
        dayOftheWeekLabel.text = forecast.date
        weatherTypeLabel.text = forecast.weatherType
        weatherImg.image = UIImage(named: forecast.weatherType)
    }

}
