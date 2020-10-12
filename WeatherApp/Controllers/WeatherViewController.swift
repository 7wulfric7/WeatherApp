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
    @IBOutlet weak var searchBar: UISearchBar!
    
    var cities = [City]()
    var filteredCities = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cities Weather"
        searchBar.delegate = self
//        searchBar.showsCancelButton = true
        setupTable()
        getCitiesFromFile()
        registerForKeyboardNotificaitons()
    }
    
    func registerForKeyboardNotificaitons() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardDidShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            if let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
                tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            }
        }
    }
    @objc func keyboardDidHide(notification: Notification) {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func setupTable() {
        tableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "cityCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    func getCitiesFromFile() {
        guard let url = Bundle.main.url(forResource: "city.list", withExtension: "json") else {
            return
        }
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        cities = try! decoder.decode([City].self, from: data)
        filteredCities.append(contentsOf: cities)
    }
}

extension WeatherViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredCities.removeAll()
            filteredCities.append(contentsOf: cities)
            tableView.reloadData()
            return
        }
        let text = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        filteredCities = cities.filter({ $0.name.lowercased().hasPrefix(text.lowercased()) })
        tableView.reloadData()
    }
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCities.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell") as! CityTableViewCell
        let city = filteredCities[indexPath.row]
        cell.setWeatherInfo(city: city)
        cell.selectionStyle = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
