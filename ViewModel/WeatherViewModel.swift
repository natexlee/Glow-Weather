//
//  JSON-Mapped.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/2/21.
//

import Foundation



class openViewModel: ObservableObject {
    @Published var openWeather: openWeatherResponse?
    
    
    var name: String {
        guard let name = openWeather?.name else {
            return "x"
        }
        return name
    }
    
    var lon: Double {
        guard let lon = openWeather?.coord?.lon else {
            return 0.0
        }
        return lon
    }
    
    var lat: Double {
        guard let lat = openWeather?.coord?.lat else {
            return 0.0
        }
        return lat
    }
    
    
    var temp: Double {
        guard let temp = openWeather?.main?.temp else {
            return 0.0
        }
        return temp
    }
 
 
    var weatherDescription: String {
        guard let weatherDescription = openWeather?.weather?[0].weatherDescription else {
            return "X"
        }
        return weatherDescription
    }
    
    var humidity: Int {
        guard let humidity = openWeather?.main?.humidity else {
            return 0
        }
        return humidity
    }
    
    var country: String {
        guard let country = openWeather?.sys?.country else {
            return "X"
        }
        return country
    }
    
    var feels_like: Double {
        guard let feels_like = openWeather?.main?.feelsLike else {
            return 0.0
        }
        return feels_like
    }
    
    var clouds: Int {
        guard let clouds = openWeather?.clouds?.all else {
            return 0
        }
        return clouds
    }
    
    var icon: String {
        guard let icon = openWeather?.weather?[0].icon else {
            return "X"
        }
        return icon
    }
    
    var pressure: Int {
        guard let pressure = openWeather?.main?.pressure else {
            return 0
        }
        return pressure
    }
  
    var windSpeed: Double {
        guard let windSpeed = openWeather?.wind?.speed else {
            return 0.0
        }
        return windSpeed
    }
    
    var tempMin: Double {
        guard let tempMin = openWeather?.main?.tempMin else {
            return 0.0
        }
        return tempMin
    }
    
    var tempMax: Double {
        guard let tempMax = openWeather?.main?.tempMax else {
            return 0.0
        }
        return tempMax
    }
 
    // Air quality index... attach to end of url
    // &aqi=yes
    

    func fetchData(cityInput: String) {
        //if cityInput.contains(" ") {
            //let cityWithSpaces = cityInput.replacingOccurrences(of: " ", with: "+")
        //} else {
            //let cityWithSpaces = cityInput
            
            guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityInput.replacingOccurrences(of: " ", with: "+"))&units=imperial&appid=25c1d8217beadf57577461677d5c235f") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            if let weatherData = try? JSONDecoder().decode(openWeatherResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.openWeather = weatherData
                    
                }
            }
        }.resume()
    }
}

/*
    func fetchWeather(cityName: String) {
           
           if cityName.contains(" ") {
               let cityWithSpaces = cityName.replacingOccurrences(of: " ", with: "+")
               let urlString = "\(weatherURL)&q=\(cityWithSpaces)"
               performRequest(with: urlString)
           } else {
               let urlString = "\(weatherURL)&q=\(cityName)"
               performRequest(with: urlString)
           }
       }
*/
 
    































    /*
struct weatherAPI: Codable {
    var weatherLocation = [location]()
    var weatherCurrent = [current]()
}

struct location: Codable {
    var name: String
    var region: String
    var country: String
    var lat: Double
    var lon: Double
    var localtime: String
}

struct current: Codable {
    var last_updated: String
    var temp_c: Double
    var temp_f: Double
    var weatherCondition = [condition]()
    var wind_mph: Double
    var wind_kph: Double
    var pressure_in: Double
    var precip_mm: Double
    var precip_in: Double
    var humidity: Int
    var feelslike_c: Double
    var feelslike_f: Double
    var vis_km: Double
    var vis_miles: Double
    var uv: Double
}

struct condition: Codable {
    var text: String
    var icon: String
}
    */









// Example JSON
/*
{
    "location":
    {
        "name":"Hilton Head Island",
        "region":"South Carolina",
        "country":"United States of America",
        "lat":32.22,"lon":-80.75,
        "tz_id":"America/Kentucky/Monticello",
        "localtime_epoch":1627898664,
        "localtime":"2021-08-02 6:04"
        
    },
    "current":
    {
        "last_updated_epoch":1627894800,
    "last_updated":"2021-08-02 05:00","temp_c":26.0,
    "temp_f":78.8,
    "is_day":0,
    "condition":
        {
        "text":"Partly cloudy",
        "icon":"//cdn.weatherapi.com/weather/64x64/night/116.png",
        "code":1003
            
        },
            "wind_mph":0.0,
            "wind_kph":0.0,
            "wind_degree":0,
            "wind_dir":"N",
            "pressure_mb":1015.0,
            "pressure_in":30.4,
            "precip_mm":0.2,
            "precip_in":0.01,
            "humidity":79,
            "cloud":50,
            "feelslike_c":28.3,
            "feelslike_f":82.9,
            "vis_km":16.0,
            "vis_miles":9.0,
            "uv":1.0,
            "gust_mph":19.0,
            "gust_kph":30.6
        }
}
*/

