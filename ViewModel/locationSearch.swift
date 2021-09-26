//
//  locationSearch.swift
//  Glowing Weather
//
//  Created by Nate Lee on 9/14/21.
//

import Foundation


class locationSearchViewModel: ObservableObject {
    @Published var locationSearch: locationResponse?
    
    
    var Name: String {
        guard let Name = locationSearch?.locationX?.nameX else {
            return "x"
        }
        return Name
    }
    
    var Region: String {
        guard let Region = locationSearch?.locationX?.regionX  else {
            return "x"
        }
        return Region
    }
    
    var Localtime: String {
        guard let Localtime = locationSearch?.locationX?.localtimeX  else {
            return "x"
        }
        return Localtime
    }
    
    var Lat: Double {
        guard let Lat = locationSearch?.locationX?.latX else {
            return 0.0
        }
        return Lat
    }
    
    var Lon: Double {
        guard let Lon = locationSearch?.locationX?.latX else {
            return 0.0
        }
        return Lon
    }
    
    var Temp_f: Double {
        guard let Temp_f = locationSearch?.currentX?.temp_fX else {
            return 0.0
        }
        return Temp_f
    }
    
    var Code: Int {
        guard let Code = locationSearch?.currentX?.conditionX?.codeX else {
            return 0
        }
        return Code
    }
    
    var Cloud: Int {
        guard let Cloud = locationSearch?.currentX?.cloudX else {
            return 0
        }
        return Cloud
    }
    
    var Wind_mph: Double {
        guard let Wind_mph = locationSearch?.currentX?.wind_mphX else {
            return 0.0
        }
        return Wind_mph
    }
    
    var Humidity: Int {
        guard let Humidity = locationSearch?.currentX?.humidityX else {
            return 0
        }
        return Humidity
    }
    
    var Feelslike_f: Double {
        guard let Feelslike_f = locationSearch?.currentX?.feelslike_fX else {
            return 0.0
        }
        return Feelslike_f
    }
    
    var Pressure_in: Double {
        guard let Pressure_in = locationSearch?.currentX?.pressure_inX else {
            return 0.0
        }
        return Pressure_in
    }
    
    var Uv: Int {
        guard let Uv = locationSearch?.currentX?.uvX else {
            return 0
        }
        return Uv
    }

    var Co: Double {
        guard let Co = locationSearch?.currentX?.air_qualityX?.coX else {
            return 0.0
        }
        return Co
    }

    var No2: Double {
        guard let No2 = locationSearch?.currentX?.air_qualityX?.no2X else {
            return 0.0
        }
        return No2
    }
    
    var O3: Double {
        guard let O3 = locationSearch?.currentX?.air_qualityX?.o3X else {
            return 0.0
        }
        return O3
    }
    
    var So2: Double {
        guard let So2 = locationSearch?.currentX?.air_qualityX?.so2X else {
            return 0.0
        }
        return So2
    }
    
    var Pm2_5: Double {
        guard let Pm2_5 = locationSearch?.currentX?.air_qualityX?.pm2_5X else {
            return 0.0
        }
        return Pm2_5
    }
    
    var Pm10: Double {
        guard let Pm10 = locationSearch?.currentX?.air_qualityX?.pm10X else {
            return 0.0
        }
        return Pm10
    }
    
    var Text: String {
        guard let Text = locationSearch?.currentX?.conditionX?.textX else {
            return "X"
        }
        return Text
    }
    
    var MinTempToday: Double {
        guard let MinTempToday = locationSearch?.forecastX?.forecastdayX?[0].dayX?.mintemp_fX else {
            return 0.0
        }
        return MinTempToday
    }
    
    var maxTemp0: Double {
        guard let maxTemp0 = locationSearch?.forecastX?.forecastdayX?[0].dayX?.maxtemp_fX else {
            return 0.0
        }
        return maxTemp0
    }
    
    var averageTemp0: Double {
        guard let averageTemp0 = locationSearch?.forecastX?.forecastdayX?[0].dayX?.avgtemp_fX else {
            return 0.0
        }
        return averageTemp0
    }
    
    var locationCode: Int {
        guard let locationCode = locationSearch?.forecastX?.forecastdayX?[1].hourX?[12].conditionX?.hourlyCode else {
            return 0
        }
        return locationCode
    }
    
    var minTempCurrent: Double {
        guard let minTempCurrent = locationSearch?.forecastX?.forecastdayX?[0].dayX?.mintemp_fX else {
            return 0
        }
        return minTempCurrent
    }

    func fetchData(latitude: Double, longitude: Double) {
        guard let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=a84577bae9694076b76213117210108&q=\(latitude),\(longitude)&days=3&aqi=yes&alerts=no") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            if let weatherData = try? JSONDecoder().decode(locationResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.locationSearch = weatherData
                }
            }
        }.resume()
    }
}



//http://api.weatherapi.com/v1/current.json?key=a84577bae9694076b76213117210108&q=\(latitude),\(longitude)&aqi=yes&
