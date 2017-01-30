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
    @IBOutlet weak var image: UILabel!
    @IBOutlet weak var weatherCondition: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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

}

