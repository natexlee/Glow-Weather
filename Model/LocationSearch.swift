//
//  LocationSearch.swift
//  Glowing Weather
//
//  Created by Nate Lee on 9/14/21.
//

import Foundation

//struct locationResponse: Codable {
//    var locationCL: clLocation?
//    var currentCL: clCurrent?
//    var forecastCL: clForecasts?
//
//    enum codingKeys: String, CodingKey {
//        case locationCL = "location"
//        case currentCL = "current"
//        case forecastCL = "forecast"
//    }
//}
//
//struct clLocation: Codable {
//    var nameCL: String?
//    var regionCL: String?
//    var latCL: Double?
//    var lonCL: Double?
//    var localtimeCL: String?
//
//    enum codingKeys: String, CodingKey {
//        case nameCL = "name"
//        case regionCL = "region"
//        case latCL = "lat"
//        case lonCL = "lon"
//        case localtimeCL = "localtime"
//    }
//}
//
//struct clCurrent: Codable {
//    var temp_fCL: Double?
//    var conditionCL: clCondition?
//    var wind_mphCL: Double?
//    var pressure_inCL: Double?
//    var cloudCL: Int?
//    var humidityCL: Int?
//    var feelslike_fCL: Double?
//    var uvCL: Int?
//    var air_qualityCL: clAirQuality?
//
//    enum codingKeys: String, CodingKey {
//        case temp_fCL = "temp_f"
//        case conditionCL = "condition"
//        case wind_mphCL = "wind_mph"
//        case pressure_inCL = "pressure_in"
//        case cloudCL = "cloud"
//        case humidityCL = "humidity"
//        case feelslike_fCL = "feelslike_f"
//        case uvCL = "uv"
//        case air_qualityCL = "air_quality"
//
//    }
//}
//
//struct clForecasts: Codable {
//    var forecastdayCL: [clForecastDay]?
//
//    enum codingKeys: String, CodingKey {
//        case forecastdayCL = "forecastday"
//    }
//}
//
//struct clForecastDay: Codable {
//    var dateCL: String?
//    var dayCL: clDay?
//    var hourCL: [clHour]?
//
//    enum codingKeys: String, CodingKey {
//        case dateCL = "date"
//        case dayCL = "day"
//        case hourCL = "hour"
//    }
//}
//
//struct clDay: Codable {
//    var maxtemp_fCL: Double?
//    var mintemp_fCL: Double?
//    var avgtemp_fCL: Double?
//    var maxwind_mphCL: Double?
//    var avghumidityCL: Int?
//    var daily_chance_of_rainCL: Int?
//    var daily_chance_of_snowCL: Int?
//
//    enum codingKeys: String, CodingKey {
//        case maxtemp_fCL = "maxtemp_f"
//        case mintemp_fCL = "mintemp_f"
//        case avgtemp_fCL = "avgtemp_f"
//        case maxwind_mphCL = "maxwind_mph"
//        case avghumidityCL = "avghumidity"
//        case daily_chance_of_rainCL = "daily_chance_of_rain"
//        case daily_chance_of_snowCL = "daily_chance_of_snow"
//    }
//
//}
//
//struct clCondition: Codable {
//    var textCL: String?
//    var codeCL: Int?
//
//    enum codingKeys: String, CodingKey {
//        case textCL = "text"
//        case codeCL = "code"
//    }
//}
//
//struct clAirQuality: Codable {
//    var coCL: Double?
//    var no2CL: Double?
//    var o3CL: Double?
//    var so2CL: Double?
//    var pm2_5CL: Double?
//    var pm10CL: Double?
//    var usEpaCL: Int?
//
//    enum codingKeys: String, CodingKey {
//        case coCL = "co"
//        case no2CL = "no2"
//        case o3CL = "o3"
//        case so2CL = "so2"
//        case pm2_5CL = "pm2_5"
//        case pm10CL = "pm10"
//        case usEpaCL = "us-epa-index"
//    }
//}
//
//struct clHour: Codable {
//    var time_epochCL: Int?
//    var timeCL: String?
//    var temp_fCL: Double?
//    var conditionCL: clHourlyCondition?
//
//    enum codingKeys: String, CodingKey {
//        case time_epochCL = "time_epoch"
//        case timeCL = "time"
//        case temp_fCL = "temp_f"
//        case conditionCL = "condition"
//    }
//}
//
//struct clHourlyCondition: Codable {
//    var textCL: String?
//    var codeCL: Int?
//
//    enum codingKeys: String, CodingKey {
//        case textCL = "text"
//        case codeCL = "code"
//    }
//}











// Location Response
struct locationResponse: Codable {
    var locationX: LocationX?
    var currentX: CurrentX?
    var forecastX: ForecastsX?


    enum CodingKeys: String, CodingKey {
        case locationX = "location"
        case currentX = "current"
        case forecastX = "forecast"
    }
}

// locationX
struct LocationX: Codable {
    var nameX: String?
    var regionX: String?
    var latX: Double?
    var lonX: Double?
    var localtimeX: String?

    enum CodingKeys: String, CodingKey {
        case nameX = "name"
        case regionX = "region"
        case latX = "lat"
        case lonX = "lon"
        case localtimeX = "localtime"
    }
}

// currentX
struct CurrentX: Codable {
    var temp_fX: Double?
    var conditionX: ConditionX?
    var wind_mphX: Double?
    var pressure_inX: Double?
    var cloudX: Int?
    var humidityX: Int?
    var feelslike_fX: Double?
    var uvX: Int?
    var air_qualityX: AirQualityX?

    enum CodingKeys: String, CodingKey {
        case temp_fX = "temp_f"
        //case conditionX = "condition"
        case wind_mphX = "wind_mph"
        case pressure_inX = "pressure_in"
        case cloudX = "cloud"
        case humidityX = "humidity"
        case feelslike_fX = "feelslike_f"
        case uvX = "uv"
    }
}

// ConditionX
struct ConditionX: Codable {
    var textX: String?
    var codeX: Int?

    enum CodingKeys: String, CodingKey {
        case textX = "text"
        case codeX = "code"
    }
}

//AirQualityX
struct AirQualityX: Codable {
   var coX: Double?
   var no2X: Double?
   var o3X: Double?
   var so2X: Double?
   var pm2_5X: Double?
   var pm10X: Double?

   enum CodingKeys: String, CodingKey {
       case coX = "co"
       case no2X = "no2"
       case o3X = "o3"
       case so2X = "so2"
       case pm2_5X = "pm2_5"
       case pm10X = "pm10"
   }
}

struct ForecastsX: Codable {
    var forecastdayX: [ForecastDayX]?

}

struct ForecastDayX: Codable {
    var dateX: String?
    var dayX: DayX?
    var hourX: [HourX]?

    enum CodingKeys: String, CodingKey {
        case dateX = "date"
        case dayX = "day"
        case hourX = "hour"
    }
}

struct DayX: Codable {
    var maxtemp_fX: Double?
    var mintemp_fX: Double?
    var avgtemp_fX: Double?
    var maxwind_mphX: Double?
    var avghumidityX: Int?
    var daily_chance_of_rainX: Int?
    var daily_chance_of_snowX: Int?

    enum CodingKeys: String, CodingKey {
        case maxtemp_fX = "maxtemp_f"
        case mintemp_fX = "mintemp_f"
        case avgtemp_fX = "avgtemp_f"
        case maxwind_mphX = "maxwind_mph"
        case avghumidityX = "avghumidity"
        case daily_chance_of_rainX = "daily_chance_of_rain"
        case daily_chance_of_snowX = "daily_chance_of_snow"
    }
}

struct HourX: Codable {
    var timeX: String?
    var temp_fX: Double?
    var conditionX: hourlyConditionX?

    enum CodingKeys: String, CodingKey {
        case timeX = "time"
        case temp_fX = "temp_f"
        case conditionX = "condition"
    }
}

struct hourlyConditionX: Codable {
    var hourlyText: String?
    var hourlyCode: Int?

    enum CodingKeys: String, CodingKey {
        case hourlyText = "text"
        case hourlyCode = "code"
    }
}















/*
struct locationResponse: Codable {
    var location: Location?
    var current: Current?
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

struct Condition: Codable {
    var text: String
    var code: Int
}

struct AirQuality: Codable {
    var co: Double?
    var no2: Double?
    var o3: Double?
    var so2: Double?
    var pm2_5: Double?
    var pm10: Double?
}
*/
