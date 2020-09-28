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
//    db653c20eb6e31337c9d5ec4c0edc9ff     - my API Key
    
    func getWeatherForCIty(id: Int) {
        let url = BASE_URL + "weather?id=\(id)&appid=" + APIKey
        AF.request(url).responseDecodable(of: WeatherInfo.self) { response in
            if let error = response.error {
                print(error.localizedDescription)
                return
            }
            if let weather = response.value {
                print(weather.id, weather.name, weather.main.tempMax)
            }
            
        }
    }
}
