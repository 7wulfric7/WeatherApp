//
//  APIManager.swift
//  WeatherApp
//
//  Created by Deniz Adil on 9/28/20.
//

import UIKit
import Alamofire


class APIManager {

    static let shared = APIManager()
    init() {}
    
//    api.openweathermap.org/data/2.5/weather?id={city id}&appid={API key}
//    db653c20eb6e31337c9d5ec4c0edc9ff
    func getWeatherForCIty(id: Int) {
        let url = BASE_URL + "weather?id=\(id)&appid=" + APIKey
        AF.request(url).responseJSON { response in
            if let error = response.error {
                print(error.localizedDescription)
                return
            }
            if let json = response.value as? [String: Any] {
                print(json)
            }
            
        }
    }
}
