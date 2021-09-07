//
//  AboutTheApp.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/26/21.
//

import SwiftUI

struct AboutTheApp: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.black), Color(.gray)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {                
        Text("About")
            .font(.system(size: 55, weight: .semibold, design: .monospaced))
            .foregroundColor(.white)
            .shadow(color: .white, radius: 45)
            .padding()
                ScrollView(.vertical) {
                Text("This app provides current weather and air quality information. While also respecting the privacy of its users by not accessing sensitive information such as your current location.")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .regular, design: .monospaced))
                    .multilineTextAlignment(.center)
                    .shadow(color: .black, radius: 15)
                    .padding()
                Spacer()
                }
                Text("Data provided by openweatherapi.com")
                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                    .foregroundColor(.black)
                    .shadow(color: .white, radius: 12)
                    .padding()
                Spacer()
            }
        }
    }
}


