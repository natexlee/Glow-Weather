//
//  NameResponse.swift
//  Glowing Weather
//
//  Created by Nate Lee on 9/13/21.
//

import Foundation

struct searchResponse: Codable {
    var location: Location?
    var current: Current?
    var forecast: Forecasts?
}

struct Location: Codable {
    var name: String?
    var region: String?
    var lat: Double?
    var lon: Double?
    var localtime: String?
}

struct Current: Codable {
    var temp_f: Double?
    var condition: Condition?
    var wind_mph: Double?
    var pressure_in: Double?
    var cloud: Int?
    var humidity: Int?
    var feelslike_f: Double?
    var uv: Int?
    var air_quality: AirQuality?
}

struct Forecasts: Codable {
    var forecastday: [ForecastDay]?
    
}

struct ForecastDay: Codable {
    var date: String?
    var day: Day?
    var hour: [Hour]?
}

struct Day: Codable {
    var maxtemp_f: Double?
    var mintemp_f: Double?
    var avgtemp_f: Double?
    var maxwind_mph: Double?
    var avghumidity: Int?
    var daily_chance_of_rain: Int?
    var daily_chance_of_snow: Int?
    
}

struct Condition: Codable {
    var text: String?
    var code: Int?
}

struct AirQuality: Codable {
    var co: Double?
    var no2: Double?
    var o3: Double?
    var so2: Double?
    var pm2_5: Double?
    var pm10: Double?
    var usEpa: Int?
    
    enum codingKeys: String, CodingKey {
        case usEpa = "us-epa-index"
    }
}

struct Hour: Codable {
    var time_epoch: Int?
    var time: String?
    var temp_f: Double?
    var condition: HourlyCondition?
}

struct HourlyCondition: Codable {
    var text: String?
    var code: Int?
}
