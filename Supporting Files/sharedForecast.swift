//
//  sharedForecast.swift
//  Glowing Weather
//
//  Created by Nate Lee on 9/30/21.
//

import Foundation

class SharedForecast: ObservableObject {
    // Forecast data for today
    @Published var locationName: String
    @Published var region: String
    @Published var icon: Int
    @Published var minTempToday: Double
    @Published var maxTempToday: Double
    @Published var avgTempToday: Double
    @Published var maxWindToday: Double
    @Published var chanceOfRainToday: Int
    @Published var chanceOfSnowToday: Int
    //Forecast data for tmrw
    @Published var iconTmrw: Int
    @Published var minTempTmrw: Double
    @Published var maxTempTmrw: Double
    @Published var avgTempTmrw: Double
    @Published var maxWindTmrw: Double
    @Published var chanceOfRainTmrw: Int
    @Published var chanceOfSnowTmrw: Int
    @Published var lastUpdated: String
    
    init(locationName: String, region: String, icon: Int, minTempToday: Double, maxTempToday: Double, avgTempToday: Double, maxWindToday: Double, chanceOfRainToday: Int, chanceOfSnowToday: Int, iconTmrw:Int, minTempTmrw: Double, maxTempTmrw: Double, avgTempTmrw: Double, maxWindTmrw: Double, chanceOfRainTmrw: Int, chanceOfSnowTmrw: Int, lastUpdated: String) {
        self.locationName = locationName
        self.region = region
        self.icon = icon
        self.minTempToday = minTempToday
        self.maxTempToday = maxTempToday
        self.avgTempToday = avgTempToday
        self.maxWindToday = maxWindToday
        self.chanceOfRainToday = chanceOfRainToday
        self.chanceOfSnowToday = chanceOfSnowToday
        self.iconTmrw = iconTmrw
        self.minTempTmrw = minTempTmrw
        self.maxTempTmrw = maxTempTmrw
        self.avgTempTmrw = avgTempTmrw
        self.maxWindTmrw = maxWindTmrw
        self.chanceOfRainTmrw = chanceOfRainTmrw
        self.chanceOfSnowTmrw = chanceOfSnowTmrw
        self.lastUpdated = lastUpdated
    }
}
