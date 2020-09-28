//
//  ViewController.swift
//  WeatherApp
//
//  Created by Deniz Adil on 9/28/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let city = cities.first!
        
        APIManager.shared.getWeatherForCIty(id: city.id)
    }


}

