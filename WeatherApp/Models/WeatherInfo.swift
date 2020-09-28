//
//  WeatherInfo.swift
//  WeatherApp
//
//  Created by Deniz Adil on 9/28/20.
//

import UIKit
//{
//    "coord": {
//        "lon": -0.13,
//        "lat": 51.51
//    },
//    "weather": [
//        {
//            "id": 800,
//            "main": "Clear",
//            "description": "clear sky",
//            "icon": "01n"
//        }
//    ],
//    "base": "stations",
//    "main": {
//        "temp": 289.74,
//        "feels_like": 286.79,
//        "temp_min": 288.71,
//        "temp_max": 291.15,
//        "pressure": 1013,
//        "humidity": 63
//    },
//    "visibility": 10000,
//    "wind": {
//        "speed": 4.1,
//        "deg": 270
//    },
//    "clouds": {
//        "all": 6
//    },
//    "dt": 1601315248,
//    "sys": {
//        "type": 1,
//        "id": 1414,
//        "country": "GB",
//        "sunrise": 1601272604,
//        "sunset": 1601315117
//    },
//    "timezone": 3600,
//    "id": 2643743,
//    "name": "London",
//    "cod": 200
//}

struct WeatherInfo: Decodable {
    var coord: Coordinate
    var weather: [Weather]
    var main: MainInfo
    var wind: Wind
    var id: Int
    var name: String?
    var cod: Int?
}

struct Weather: Decodable {
    var id: Int
    var main: String?
    var description: String?
    var icon: String?
}

struct Coordinate: Decodable {
    var long: Double?
    var latt: Double?
}

struct MainInfo: Decodable {
    var temp: Double?
    var feelsLike: Double?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Double?
    var humidity: Int?
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

struct Wind: Decodable {
    var speed: Double?
    var deg: Int?
    
}


