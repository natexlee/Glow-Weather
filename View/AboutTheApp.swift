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
            LinearGradient(gradient: Gradient(colors: [Color(.blue), Color(.systemOrange)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.85)
                .ignoresSafeArea()
            VStack {
                Text("About")
                    .font(.system(size: 55, weight: .semibold, design: .monospaced))
                    .foregroundColor(.white)
                    .shadow(color: .gray, radius: 45)
                    .padding()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Spacer(minLength: 120)
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(.black)
                                .opacity(0.4)
                            HStack {
                                Text("This app provides current weather and air quality information. Stay tuned for more features...")
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .foregroundColor(.black)
                                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                                    .padding(0.2)
                                    .padding([.leading, .trailing])
                            }
                        }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal)
                    }
                }
                Text("Data provided by weatherapi.com")
                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                    .foregroundColor(.black)
                    .shadow(color: .white, radius: 12)
                    .padding()
                Spacer()
            }
        }
    }
}


