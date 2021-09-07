//
//  AboutAirQuality.swift
//  Glowing Weather
//
//  Created by Nate Lee on 9/5/21.
//

import SwiftUI

struct AboutAirQuality: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.black), Color(.gray)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ScrollView {
        VStack {
            Text("Air Quality")
                .font(.system(size: 55, weight: .semibold, design: .monospaced))
                .foregroundColor(.white)
                .shadow(color: .white, radius: 45)
                .padding()
        Text("Air quality data is retrieved from openweatherapi.com, and evaluated based on EPA guidelines for environmental air pollution levels.")
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .regular, design: .monospaced))
            .multilineTextAlignment(.center)
            .shadow(color: .black, radius: 15)
            .padding()
            Image("EPAGuidelines")
                .resizable()
                .padding()

            Spacer()
                }
            }
        }
    }
}
