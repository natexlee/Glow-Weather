//
//  AQIViewModel.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/25/21.
//

import Foundation

struct airResponse: Codable {
    var list: [List]?
}


struct List: Codable {
    var components: Components?
}


struct Components: Codable {
    var co: Double?
    var no: Int?
    var no2: Int?
    var o3: Double?
    var so2: Int?
    var pm2_5: Double?
    var pm10: Double?
    var nh3: Int?
}


 
