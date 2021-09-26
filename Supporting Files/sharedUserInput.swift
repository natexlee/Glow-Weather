//
//  sharedUserInput.swift
//  Glowing Weather
//
//  Created by Nate Lee on 9/19/21.
//

import Foundation

class SharedUserInput: ObservableObject {
    @Published var userUnit: Int
    @Published var observedCityName: String
    @Published var clName: String
    
    init(userUnit: Int, observedCityName: String, clName: String) {
            self.userUnit = userUnit
            self.observedCityName = observedCityName
            self.clName = clName
        }
}
