//
//  ReverseGeocodeVM.swift
//  Glowing Weather
//
//  Created by Nate Lee on 9/12/21.
//

import Foundation


class nameViewModel: ObservableObject {
    @Published var nameSearchResponse: searchResponse?
    
    var name: String {
        guard let name = nameSearchResponse?.location?.name  else {
            return "x"
        }
        return name
    }
    
    var region: String {
        guard let region = nameSearchResponse?.location?.region  else {
            return "x"
        }
        return region
    }
    
    var localtime: String {
        guard let localtime = nameSearchResponse?.location?.localtime  else {
            return "x"
        }
        return localtime
    }
    
    var lat: Double {
        guard let lat = nameSearchResponse?.location?.lat else {
            return 0.0
        }
        return lat
    }
    
    var lon: Double {
        guard let lon = nameSearchResponse?.location?.lon else {
            return 0.0
        }
        return lon
    }
    
    var temp_f: Double {
        guard let temp_f = nameSearchResponse?.current?.temp_f else {
            return 0.0
        }
        return temp_f
    }
    
    var code: Int {
        guard let code = nameSearchResponse?.current?.condition?.code else {
            return 0
        }
        return code
    }
    
    var cloud: Int {
        guard let cloud = nameSearchResponse?.current?.cloud else {
            return 0
        }
        return cloud
    }
    
    var wind_mph: Double {
        guard let wind_mph = nameSearchResponse?.current?.wind_mph else {
            return 0.0
        }
        return wind_mph
    }
    
    var humidity: Int {
        guard let humidity = nameSearchResponse?.current?.humidity else {
            return 0
        }
        return humidity
    }
    
    var feelslike_f: Double {
        guard let feelslike_f = nameSearchResponse?.current?.feelslike_f else {
            return 0.0
        }
        return feelslike_f
    }
    
    var pressure_in: Double {
        guard let pressure_in = nameSearchResponse?.current?.pressure_in else {
            return 0.0
        }
        return pressure_in
    }
    
    var uv: Int {
        guard let uv = nameSearchResponse?.current?.uv else {
            return 0
        }
        return uv
    }
    
    var co: Double {
        guard let co = nameSearchResponse?.current?.air_quality?.co else {
            return 0.0
        }
        return co
    }
    
    var no2: Double {
        guard let no2 = nameSearchResponse?.current?.air_quality?.no2 else {
            return 0.0
        }
        return no2
    }
    
    var o3: Double {
        guard let o3 = nameSearchResponse?.current?.air_quality?.o3 else {
            return 0.0
        }
        return o3
    }
    
    var so2: Double {
        guard let so2 = nameSearchResponse?.current?.air_quality?.so2 else {
            return 0.0
        }
        return so2
    }
    
    var pm2_5: Double {
        guard let pm2_5 = nameSearchResponse?.current?.air_quality?.pm2_5 else {
            return 0.0
        }
        return pm2_5
    }
    
    var pm10: Double {
        guard let pm10 = nameSearchResponse?.current?.air_quality?.pm10 else {
            return 0.0
        }
        return pm10
    }
    
    //    var usEpa: Int {
    //        guard let usEpa = nameSearchResponse?.current?.air_quality?.usEpa else {
    //            return 0
    //        }
    //        return usEpa
    //    }
    
    var text: String {
        guard let text = nameSearchResponse?.current?.condition?.text  else {
            return "x"
        }
        return text
    }
    
    var dailyDate: String {
        guard let dailyDate = nameSearchResponse?.forecast?.forecastday?[0].date else {
            return "X"
        }
        return dailyDate
    }
    
    var maxTempToday: Double {
        guard let maxTempToday = nameSearchResponse?.forecast?.forecastday?[0].day?.maxtemp_f else {
            return 0.0
        }
        return maxTempToday
    }
    
    var minTempToday: Double {
        guard let minTempToday = nameSearchResponse?.forecast?.forecastday?[0].day?.mintemp_f else {
            return 0.0
        }
        return minTempToday
    }
    
    var avgTempToday: Double {
        guard let avgTempToday = nameSearchResponse?.forecast?.forecastday?[0].day?.avgtemp_f else {
            return 0.0
        }
        return avgTempToday
    }
    
    var maxWindToday: Double {
        guard let maxWindToday = nameSearchResponse?.forecast?.forecastday?[0].day?.maxwind_mph else {
            return 0.0
        }
        return maxWindToday
    }
    
    var avgHumidityToday: Int {
        guard let avgHumidityToday = nameSearchResponse?.forecast?.forecastday?[0].day?.avghumidity else {
            return 0
        }
        return avgHumidityToday
    }
    
    var chanceOfRainToday: Int {
        guard let chanceOfRainToday = nameSearchResponse?.forecast?.forecastday?[0].day?.daily_chance_of_rain else {
            return 0
        }
        return chanceOfRainToday
    }
    
    var chanceOfSnowToday: Int {
        guard let chanceOfSnowToday = nameSearchResponse?.forecast?.forecastday?[0].day?.daily_chance_of_snow else {
            return 0
        }
        return chanceOfSnowToday
    }
    
    var minTempTmrw: Double {
        guard let minTempTmrw = nameSearchResponse?.forecast?.forecastday?[1].day?.mintemp_f else {
            return 0.0
        }
        return minTempTmrw
    }
    
    var maxTempTmrw: Double {
        guard let maxTempTmrw = nameSearchResponse?.forecast?.forecastday?[1].day?.maxtemp_f else {
            return 0.0
        }
        return maxTempTmrw
    }
    
    var codeTmrw: Int {
        guard let codeTmrw = nameSearchResponse?.forecast?.forecastday?[1].hour?[12].condition?.code else {
            return 0
        }
        return codeTmrw
    }
    
    var avgTempTmrw: Double {
        guard let avgTempTmrw = nameSearchResponse?.forecast?.forecastday?[1].day?.avgtemp_f else {
            return 0.0
        }
        return avgTempTmrw
    }
    
    var maxWindTmrw: Double {
        guard let maxWindTmrw = nameSearchResponse?.forecast?.forecastday?[1].day?.maxwind_mph else {
            return 0.0
        }
        return maxWindTmrw
    }
    
    var avgHumidityTmrw: Int {
        guard let avgHumidityTmrw = nameSearchResponse?.forecast?.forecastday?[1].day?.avghumidity else {
            return 0
        }
        return avgHumidityTmrw
    }
    
    var chanceOfRainTmrw: Int {
        guard let chanceOfRainTmrw = nameSearchResponse?.forecast?.forecastday?[1].day?.daily_chance_of_rain else {
            return 0
        }
        return chanceOfRainTmrw
    }
    
    var chanceOfSnowTmrw: Int {
        guard let chanceOfSnowTmrw = nameSearchResponse?.forecast?.forecastday?[1].day?.daily_chance_of_snow else {
            return 0
        }
        return chanceOfSnowTmrw
    }
    
    func fetchData(cityInput: String) {
        guard let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=a84577bae9694076b76213117210108&q=\(cityInput.replacingOccurrences(of: " ", with: "_"))&days=6&aqi=yes&alerts=no") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            if let weatherData = try? JSONDecoder().decode(searchResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.nameSearchResponse = weatherData
                }
            }
        }.resume()
    }
}


