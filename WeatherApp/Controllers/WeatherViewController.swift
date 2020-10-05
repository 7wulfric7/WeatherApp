//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Deniz Adil on 9/30/20.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        // Do any additional setup after loading the view.
    }
    
    func setupTable() {
        tableView.register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "titleCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell") as! TitleTableViewCell
        let city = cities[indexPath.row]
        cell.lblName.text = city.name
        APIManager.shared.getWeatherForCIty(id: city.id) { (weather, error) in
            if let weather = weather {
                cell.lblTemp.text = "\(weather.main.temp!)°"
                cell.lblWeatherDesc.text = weather.weather[0].description?.capitalized
            }
        }
        return cell
    }
    
    
    
}
