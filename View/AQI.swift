//
//  Forecast.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/1/21.
//

import SwiftUI

struct Forecast: View {
    @State var cityInput = ""
    @ObservedObject var airWeather = AirViewModel()
    @ObservedObject var openWeather = openViewModel()
    @State var latitudes = 0.0
    @State var longitudes = 0.0
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.black), Color(.gray)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ScrollView(.vertical) {
        VStack {
            let latitudes = openWeather.lat
            let longitudes = openWeather.lon
            HStack {
                Button(action: {
                    hideKeyboard()
                    self.openWeather.fetchData(cityInput: cityInput)
                    self.airWeather.fetchData(latitude: latitudes, longitude: longitudes)
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .padding(.leading)
                })
                TextField("Search City", text: $cityInput, onCommit: {
                    self.openWeather.fetchData(cityInput: cityInput)
    
                    if openWeather.lat != 0.0 {
                        self.airWeather.fetchData(latitude: latitudes, longitude: longitudes)
                }
                }).extensionTextFieldView(roundedCornes: 38, startColor: .white, endColor: Color("GradientColorBlue"))
                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                .padding()
            }.padding(.top, 30)
            
            if openWeather.lon != 0.0000 {
                Text("Lat: \(openWeather.lat), Lon: \(openWeather.lon)")                    .foregroundColor(.white)
                    .onAppear(perform: {
                       self.airWeather.fetchData(latitude: latitudes, longitude: longitudes)
                    })
            }
            
            // Air quality data
            
            if airWeather.co != 0.0000 {
              
                // Carbon Monoxide
                ZStack {
                    if 0.0...5263.69 ~= airWeather.co  {
                    RoundedRectangle(cornerRadius: 38.0)
                        .foregroundColor(Color("customLightGreen"))
                        .shadow(color: Color(.green), radius: 15)
                    } else if 5263.70...11185.93 ~= airWeather.co {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color("customLightYellow"))
                            .shadow(color: Color(.green), radius: 15)
                    } else {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color("customLightRed"))
                            .shadow(color: Color(.red), radius: 15)
                    }
                    
                    HStack {
                        Text("Co: \(airWeather.co) µg/m3")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                    .shadow(color: .black, radius: 15)
                    .padding()
                    }
                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding([.leading, .bottom, .trailing])
                
                // No2
                
                ZStack {
                    if 0...151 ~= airWeather.no2  {
                    RoundedRectangle(cornerRadius: 38.0)
                        .foregroundColor(Color("customLightGreen"))
                        .shadow(color: Color(.green), radius: 15)
                    } else if 152...205 ~= airWeather.no2 {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color("customLightYellow"))
                            .shadow(color: Color(.green), radius: 15)
                    } else {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color("customLightRed"))
                            .shadow(color: Color(.red), radius: 15)
                    }
                    
                    HStack {
                        Text("No2: \(airWeather.no2) µg/m3")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                    .shadow(color: .black, radius: 15)
                    .padding()
                    }
                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding([.leading, .bottom, .trailing])
                
                
                // o3
                
                ZStack {
                    if 0...116 ~= airWeather.o3  {
                    RoundedRectangle(cornerRadius: 38.0)
                        .foregroundColor(Color("customLightGreen"))
                        .shadow(color: Color(.green), radius: 15)
                    } else if 117...150 ~= airWeather.o3 {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color("customLightYellow"))
                            .shadow(color: Color(.green), radius: 15)
                    } else {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color("customLightRed"))
                            .shadow(color: Color(.red), radius: 15)
                    }
                    
                    HStack {
                        Text("o3: \(airWeather.o3) µg/m3")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                    .shadow(color: .black, radius: 15)
                    .padding()
                    }
                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding([.leading, .bottom, .trailing])
                
               
                // Sulfur dioxide
                
                ZStack {
                    if 0...99 ~= airWeather.so2  {
                    RoundedRectangle(cornerRadius: 38.0)
                        .foregroundColor(Color("customLightGreen"))
                        .shadow(color: Color(.green), radius: 15)
                    } else if 100...214 ~= airWeather.so2 {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color("customLightYellow"))
                            .shadow(color: Color(.green), radius: 15)
                    } else {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color("customLightRed"))
                            .shadow(color: Color(.red), radius: 15)
                    }
                    
                    HStack {
                        Text("So2: \(airWeather.so2) µg/m3")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                    .shadow(color: .black, radius: 15)
                    .padding()
                    }
                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding([.leading, .bottom, .trailing])
                

                // Particulate Matter (2.5 Microns)
                
                ZStack {
                    if 0.0...12.0 ~= airWeather.pm2_5  {
                    RoundedRectangle(cornerRadius: 38.0)
                        .foregroundColor(Color("customLightGreen"))
                        .shadow(color: Color(.green), radius: 15)
                    } else if 12.1...35.4 ~= airWeather.pm2_5 {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color("customLightYellow"))
                            .shadow(color: Color(.green), radius: 15)
                    } else {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color("customLightRed"))
                            .shadow(color: Color(.red), radius: 15)
                    }
                    
                    HStack {
                        Text("Pm(2.5): \(airWeather.pm2_5) µg/m3")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                    .shadow(color: .black, radius: 15)
                            .padding(.horizontal)
                    }
                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding([.leading, .bottom, .trailing])
                

              // Particulate Matter (10 Microns)
                
                ZStack {
                    if 0...54.0 ~= airWeather.pm10  {
                    RoundedRectangle(cornerRadius: 38.0)
                        .foregroundColor(Color("customLightGreen"))
                        .shadow(color: Color(.green), radius: 15)
                    } else if 55.0...154.0 ~= airWeather.pm10 {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color("customLightYellow"))
                            .shadow(color: Color(.green), radius: 15)
                    } else {
                        RoundedRectangle(cornerRadius: 38.0)
                            .foregroundColor(Color("customLightRed"))
                            .shadow(color: Color(.red), radius: 15)
                    }
                    
                    HStack {
                        Text("Pm(10): \(airWeather.pm10) µg/m3")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                    .shadow(color: .black, radius: 15)
                    .padding()
                    }
                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding([.leading, .bottom, .trailing])
            }
        }
        }
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .ignoresSafeArea(.keyboard)
        }
    }



