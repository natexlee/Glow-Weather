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
            LinearGradient(gradient: Gradient(colors: [Color(.blue), Color(.systemOrange)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.85)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Text("Air Quality")
                    .font(.system(size: 55, weight: .semibold, design: .monospaced))
                    .foregroundColor(.white)
                    .shadow(color: .white, radius: 45)
                    .padding()
                ScrollView(.vertical, showsIndicators: false) {
                    Spacer(minLength: 25)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color(.black))
                            .opacity(0.4)
                            .shadow(color: Color(.gray), radius: 18)
                        Text("o3: Ozone")
                            .font(.system(size: 25, weight: .medium, design: .monospaced))
                            .foregroundColor(.white)
                    }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(0.2)
                    ZStack {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color(.black))
                            .opacity(0.4)
                            .shadow(color: Color(.gray), radius: 18)
                        Text("Co: Carbon")
                            .font(.system(size: 25, weight: .medium, design: .monospaced))
                            .foregroundColor(.white)
                        
                    }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(0.2)
                    ZStack {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color(.black))
                            .opacity(0.4)
                            .shadow(color: Color(.gray), radius: 18)
                        Text("So2: Sulfur Dioxide")
                            .font(.system(size: 25, weight: .medium, design: .monospaced))
                            .foregroundColor(.white)
                    }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(0.2)
                    ZStack {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color(.black))
                            .opacity(0.4)
                            .shadow(color: Color(.gray), radius: 18)
                        Text("Pm: Particulate Matter")
                            .font(.system(size: 22, weight: .medium, design: .monospaced))
                            .foregroundColor(.white)
                    }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(0.2)
                    ZStack {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color(.black))
                            .opacity(0.4)
                            .shadow(color: Color(.gray), radius: 18)
                        Text("No2: Nitrogen Dioxide")
                            .font(.system(size: 25, weight: .medium, design: .monospaced))
                            .foregroundColor(.white)
                    }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(0.2)
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.black)
                            .opacity(0.4)
                        VStack {
                            Text("Air quality data is retrieved from weatherapi.com, and evaluated based on EPA guidelines for environmental air pollution levels.")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .regular, design: .monospaced))
                                .multilineTextAlignment(.center)
                                .shadow(color: .black, radius: 15)
                                .padding()
                            Image("EPAGuidelines")
                                .resizable()
                                .padding()
                        }
                    }
                    Spacer()
                }.padding(.horizontal)
            }.foregroundColor(.clear)
        }
    }
}
