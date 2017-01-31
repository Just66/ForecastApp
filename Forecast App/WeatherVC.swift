//
//  WeatherVC.swift
//  Forecast App
//
//  Created by Dmytro Aprelenko on 28.01.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var thumgImage: UIImageView!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var weatherCondition: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var currentWeather: CurrentWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.updateWeatherUI()
        }
        tableView.delegate = self
        tableView.dataSource = self
        
           }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func updateWeatherUI() {
        date.text = currentWeather.date
        currentTemp.text = "\(currentWeather.currentTemp)"
        weatherCondition.text = currentWeather.weatherType
        location.text = currentWeather.cityName
        thumgImage.image = UIImage(named: currentWeather.weatherType)
    }

}

