//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Deniz Adil on 9/30/20.
//

import UIKit
import Kingfisher

class WeatherViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    var cities = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        getCitiesFromFile()
        
    }
    
    func setupTable() {
        tableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "titleCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    func getCitiesFromFile () {
        guard let url = Bundle.main.url(forResource: "city.list", withExtension: "json") else {
            return
        }
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        cities = try! decoder.decode([City].self, from: data)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell") as! CityTableViewCell
        let city = cities[indexPath.row]
        cell.setWeatherInfo(city: city)
        cell.selectionStyle = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
