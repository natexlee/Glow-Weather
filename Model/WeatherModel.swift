//
//  WeatherViewModel.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/1/21.
//

import Foundation



// Weather Response
struct openWeatherResponse: Codable {
    var coord: Coord?
    var weather: [WeatherEnt]?
    var base: String?
    var main: Main?
    var visibility: Int?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var sys: Sys?
    var timezone: Int?
    var id: Int
    var name: String?
    var cod: Int?

    enum CodingKeys: String, CodingKey {
        case coord = "coord"
        case weather = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"
        case wind = "wind"
        case clouds = "clouds"
        case dt = "dt"
        case sys = "sys"
        case timezone = "timezone"
        case id = "id"
        case name = "name"
        case cod = "cod"
    }
}

// Clouds
struct Clouds: Codable {
    var all: Int?

    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}

// Coordinates
struct Coord: Codable {
    var lon: Double?
    var lat: Double?

    enum CodingKeys: String, CodingKey {
        case lon = "lon"
        case lat = "lat"
    }
}

// Main
struct Main: Codable {
    var temp: Double?
    var feelsLike: Double?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Int?
    var humidity: Int?

    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
    }
}

// Sys
struct Sys: Codable {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}

// Weather
struct WeatherEnt: Codable {
    var id: Int?
    var main: String?
    var weatherDescription: String?
    var icon: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case weatherDescription = "description"
        case icon = "icon"
    }
}

 // Wind
struct Wind: Codable {
    var speed: Double?
    var deg: Int?

    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
    }
}








