//
//  WeatherVC.swift
//  Forecast App
//
//  Created by Dmytro Aprelenko on 28.01.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var thumgImage: UIImageView!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var weatherCondition: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var tableView: UITableView!

    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
//locationManager.requestWhenInUseAuthorization()
    locationManager.startMonitoringSignificantLocationChanges()
        

        tableView.delegate = self
        tableView.dataSource = self
        currentWeather = CurrentWeather()
        
           }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationAuthStatus()
    }
    
    func locationAuthStatus()
    {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse
        {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longtitude = currentLocation.coordinate.longitude
            currentWeather.downloadWeatherDetails {
                self.downloadForecastData {
                    self.updateWeatherUI()
                }
                
            }

        } else {
            locationManager.requestWhenInUseAuthorization()
            //locationAuthStatus()
        }
    }
    
    func downloadForecastData(compleated: @escaping DownloadComplete) {
        let forecastURL = URL(string: FORECAST_WEATHERA_URL)
        Alamofire.request(forecastURL!).responseJSON { response in
            if let JSON = response.result.value {
                if let dict = JSON as? Dictionary<String, Any> {
                    if let list = dict["list"] as? [Dictionary<String, Any>] {
                        
                        for obj in list {
                            let forecast = Forecast(weatherDict: obj)
                            self.forecasts.append(forecast)
                     }
                        self.forecasts.remove(at: 0)
                        self.tableView.reloadData()
                   }
                }
             }
            compleated()
          }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeatherCell {
            let forecast = forecasts[indexPath.row]
            cell.congigureCell(forecast: forecast)
            return cell
        }
        else {
            return WeatherCell()
        }
    }
    
    func updateWeatherUI() {
        date.text = currentWeather.date
        currentTemp.text = "\(currentWeather.currentTemp)"
        weatherCondition.text = currentWeather.weatherType
        location.text = currentWeather.cityName
        thumgImage.image = UIImage(named: currentWeather.weatherType)
    }

}

