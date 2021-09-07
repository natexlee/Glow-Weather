//
//  ContactInfo.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/27/21.
//

import SwiftUI

struct ContactInfo: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.black), Color(.gray)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ScrollView {
        VStack {
            Text("Contact")
                .font(.system(size: 55, weight: .semibold, design: .monospaced))
                .foregroundColor(.white)
                .shadow(color: .white, radius: 45)
                .padding()
        Text("officialnatelee@gmail.com")
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .regular, design: .monospaced))
            .multilineTextAlignment(.center)
            .shadow(color: .black, radius: 15)
            .padding()
            Text("twitter: @natexlee")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .regular, design: .monospaced))
                .multilineTextAlignment(.center)
                .shadow(color: .black, radius: 15)
                .padding()

            Spacer()
                }
            }
        }
    }
}

