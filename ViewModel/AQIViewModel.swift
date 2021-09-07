//
//  AQIMap.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/25/21.
//

import Foundation

class AirViewModel: ObservableObject {
    @Published var airWeather: airResponse?
        
    var co: Double {
        guard let co = airWeather?.list?[0].components?.co else {
            return 0.0
        }
        return co
    }
    
    var no: Int {
        guard let no = airWeather?.list?[0].components?.no else {
            return 0
        }
        return no
    }
   
    var no2: Int {
        guard let no2 = airWeather?.list?[0].components?.no2 else {
            return 0
        }
        return no2
    }
    
    var o3: Double {
        guard let o3 = airWeather?.list?[0].components?.o3 else {
            return 0
        }
        return o3
    }
    
    var so2: Int {
        guard let so2 = airWeather?.list?[0].components?.so2 else {
            return 0
        }
        return so2
    }
    
    var pm2_5: Double {
        guard let pm2_5 = airWeather?.list?[0].components?.pm2_5 else {
            return 0
        }
        return pm2_5
    }
    
    var pm10: Double {
        guard let pm10 = airWeather?.list?[0].components?.pm10 else {
            return 0
        }
        return pm10
    }
    
    var nh3: Int {
        guard let nh3 = airWeather?.list?[0].components?.nh3 else {
            return 0
        }
        return nh3
    }
    

    // Air quality index... attach to end of url
    // &aqi=yes
    

    func fetchData(latitude: Double, longitude: Double) {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/air_pollution?lat=\(longitude)&lon=\(longitude)&appid=25c1d8217beadf57577461677d5c235f") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            if let weatherData = try? JSONDecoder().decode(airResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.airWeather = weatherData
                }
            }
        }.resume()
    }
}
