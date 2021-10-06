//
//  Forecast.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/1/21.
//

import SwiftUI

struct Forecast: View {
    @State var selected = 1
    @State var cityInput = ""
    @State var latitudes = 0.0
    @State var longitudes = 0.0
    @State var searchedLocation = ""
    @ObservedObject var locationManager = LocationManager.shared
    @ObservedObject private var locationXManager = LocationManager()
    @ObservedObject var nameResponse = nameViewModel()
    @State var viewPicker = 2
    @State private var selectedChoice: Int = 1
    @EnvironmentObject var sharedUserInput: SharedUserInput
    @State var locationToName = ""
    @State var locationParam = ""
    @EnvironmentObject var sharedForecast: SharedForecast
    
    // max wind today
    var wsConverted: Double {
        if sharedUserInput.userUnit == 1 {
            return sharedForecast.maxWindToday
        } else {
            return sharedForecast.maxWindToday * 1.609344
        }
    }
    
    // converts max wind speed for tmrw
    var wsConvertedTmrw: Double {
        if sharedUserInput.userUnit == 1 {
            return sharedForecast.maxWindTmrw
        } else {
            return sharedForecast.maxWindTmrw * 1.609344
        }
    }
    
    // switches mph/kph label
    var windUnit: String {
        if sharedUserInput.userUnit == 1 {
            return "MPH"
        } else {
            return "KPH"
        }
    }
    
    // temp conversion
    var tempConvert1: Double {
        if sharedUserInput.userUnit == 1 {
            return 0.0
        } else {
            return -32.0
        }
    }
    
    // temp conversion
    var tempConvert2: Double {
        if sharedUserInput.userUnit == 1 {
            return 1.0
        } else {
            return 0.5556
        }
    }
    
    // Icon image for current weather
    var iconImage: String {
        switch sharedForecast.icon {
        case 1000: return "sun.max.fill"
        case 1003: return "cloud.sun.fill"
        case 1006: return "cloud.fill"
        case 1030, 1063, 1150, 1153, 1240: return "cloud.drizzle.fill"
        case 1180, 1183, 1186, 1189, 1243: return "cloud.rain.fill"
        case 1192, 1195, 1246: return "cloud.heavyrain.fill"
        case 1087, 1279, 1282: return "cloud.bolt.fill"
        case 1114: return "wind.snow"
        case 1117, 1219, 1222, 1225, 1258: return "cloud.snow.fill"
        case 1135, 1147: return "cloud.fog.fill"
        case 1069, 1072, 1168, 1171, 1198, 1201, 1204, 1207, 1249, 1252: return "cloud.sleet.fill"
        case 1066, 1210, 1213, 1216, 1255: return "snow"
        case 1009: return "sun.haze.fill"
        case 1237, 1261, 1264: return "cloud.hail.fill"
        case 1273, 1276: return "cloud.bolt.rain.fill"
        default: return "cloud.fill"
        }
    }
    
    // Icon image for tmrw
    var iconImageTmrw: String {
        switch sharedForecast.iconTmrw {
        case 1000: return "sun.max.fill"
        case 1003: return "cloud.sun.fill"
        case 1006: return "cloud.fill"
        case 1030, 1063, 1150, 1153, 1240: return "cloud.drizzle.fill"
        case 1180, 1183, 1186, 1189, 1243: return "cloud.rain.fill"
        case 1192, 1195, 1246: return "cloud.heavyrain.fill"
        case 1087, 1279, 1282: return "cloud.bolt.fill"
        case 1114: return "wind.snow"
        case 1117, 1219, 1222, 1225, 1258: return "cloud.snow.fill"
        case 1135, 1147: return "cloud.fog.fill"
        case 1069, 1072, 1168, 1171, 1198, 1201, 1204, 1207, 1249, 1252: return "cloud.sleet.fill"
        case 1066, 1210, 1213, 1216, 1255: return "snow"
        case 1009: return "sun.haze.fill"
        case 1237, 1261, 1264: return "cloud.hail.fill"
        case 1273, 1276: return "cloud.bolt.rain.fill"
        default: return "cloud.fill"
        }
    }
    
    var body: some View {
        
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Spacer(minLength: 50)
                    
                    if sharedForecast.minTempToday != 1.0 {
                        VStack {
                            Text("\(sharedForecast.locationName)")
                                .foregroundColor(.white)
                                .font(.system(size: 38, weight: .semibold, design: .monospaced))
                                .multilineTextAlignment(.center)
                                .shadow(color: .black, radius: 30)
                                .padding(.top, 10)
                                .padding(10)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            Group {
                                Text("\(sharedForecast.region)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold, design: .monospaced))
                                    .multilineTextAlignment(.center)
                                    .shadow(color: .black, radius: 15)
                                    .padding(.top, 0.1)
                                    .padding(.bottom, 3)
                                Image(systemName: "\(iconImage)")
                                    .renderingMode(.original)
                                    .font(.system(size: 170))
                                    .foregroundColor(Color.white)
                                    .shadow(color: .black, radius: 45)
                                    .padding(.trailing, 6)
                                Text("Today")
                                    .foregroundColor(.white)
                                    .font(.system(size: 35, weight: .bold, design: .monospaced))
                                    .multilineTextAlignment(.center)
                                    .shadow(color: .black, radius: 12)
                                    .padding(.top)
                                    .padding(.horizontal)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color(.black))
                                        .opacity(0.45)
                                        .shadow(color: Color(.gray), radius: 18)
                                    Text("Min: \(Int((sharedForecast.minTempToday + tempConvert1) * tempConvert2))º Max: \(Int((sharedForecast.maxTempToday + tempConvert1) * tempConvert2))º")
                                        .font(.system(size: 25, weight: .medium, design: .monospaced))
                                        .foregroundColor(.white)
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(0.2)
                                    .padding([.leading, .trailing])
                                ZStack {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color(.black))
                                        .opacity(0.45)
                                        .shadow(color: Color(.gray), radius: 18)
                                    Text("Average Temp: \(Int((sharedForecast.avgTempToday + tempConvert1) * tempConvert2))º")
                                        .font(.system(size: 25, weight: .medium, design: .monospaced))
                                        .foregroundColor(.white)
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(0.2)
                                    .padding([.leading, .trailing])
                                ZStack {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color(.black))
                                        .opacity(0.45)
                                        .shadow(color: Color(.gray), radius: 18)
                                    Text("Max Wind: \(Int(wsConverted)) \(windUnit)")
                                        .font(.system(size: 25, weight: .medium, design: .monospaced))
                                        .foregroundColor(.white)
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(0.2)
                                    .padding([.leading, .trailing])
                                ZStack {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color(.black))
                                        .opacity(0.45)
                                        .shadow(color: Color(.gray), radius: 18)
                                    Text("Chance Of Rain: \(sharedForecast.chanceOfRainToday)%")
                                        .font(.system(size: 25, weight: .medium, design: .monospaced))
                                        .foregroundColor(.white)
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(0.2)
                                    .padding([.leading, .trailing])
                                ZStack {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color(.black))
                                        .opacity(0.45)
                                        .shadow(color: Color(.gray), radius: 18)
                                    Text("Chance Of Snow: \(sharedForecast.chanceOfSnowToday)%")
                                        .font(.system(size: 25, weight: .medium, design: .monospaced))
                                        .foregroundColor(.white)
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(0.2)
                                    .padding([.leading, .trailing])
                            }
                            
                            // Forecast for tmrw
                            VStack {
                                Text("Tomorrow")
                                    .foregroundColor(.white)
                                    .font(.system(size: 35, weight: .bold, design: .monospaced))
                                    .multilineTextAlignment(.center)
                                    .shadow(color: .black, radius: 12)
                                    .padding(.top)
                                    .padding(.horizontal)
                                Group {
                                    Image(systemName: "\(iconImageTmrw)")
                                        .renderingMode(.original)
                                        .font(.system(size: 170))
                                        .foregroundColor(Color.white)
                                        .shadow(color: .black, radius: 45)
                                        .padding(.trailing, 6)
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color(.black))
                                            .opacity(0.45)
                                            .shadow(color: Color(.gray), radius: 18)
                                        Text("Min: \(Int((sharedForecast.minTempTmrw + tempConvert1) * tempConvert2))º Max: \(Int((sharedForecast.maxTempTmrw + tempConvert1) * tempConvert2))º")
                                            .font(.system(size: 25, weight: .medium, design: .monospaced))
                                            .foregroundColor(.white)
                                    }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .padding(0.2)
                                        .padding([.leading, .trailing])
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color(.black))
                                            .opacity(0.45)
                                            .shadow(color: Color(.gray), radius: 18)
                                        Text("Average Temp: \(Int((sharedForecast.avgTempTmrw + tempConvert1) * tempConvert2))º")
                                            .font(.system(size: 25, weight: .medium, design: .monospaced))
                                            .foregroundColor(.white)
                                    }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .padding(0.2)
                                        .padding([.leading, .trailing])
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color(.black))
                                            .opacity(0.45)
                                            .shadow(color: Color(.gray), radius: 18)
                                        Text("Max Wind: \(Int(wsConvertedTmrw)) \(windUnit)")
                                            .font(.system(size: 25, weight: .medium, design: .monospaced))
                                            .foregroundColor(.white)
                                    }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .padding(0.2)
                                        .padding([.leading, .trailing])
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color(.black))
                                            .opacity(0.45)
                                            .shadow(color: Color(.gray), radius: 18)
                                        Text("Chance Of Rain: \(sharedForecast.chanceOfRainTmrw)%")
                                            .font(.system(size: 25, weight: .medium, design: .monospaced))
                                            .foregroundColor(.white)
                                    }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .padding(0.2)
                                        .padding([.leading, .trailing])
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color(.black))
                                            .opacity(0.45)
                                            .shadow(color: Color(.gray), radius: 18)
                                        Text("Chance Of Snow: \(sharedForecast.chanceOfSnowTmrw)%")
                                            .font(.system(size: 25, weight: .medium, design: .monospaced))
                                            .foregroundColor(.white)
                                    }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .padding(0.2)
                                        .padding([.leading, .trailing])
                                    Text("Updated: \(sharedForecast.lastUpdated)")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .semibold, design: .monospaced))
                                        .shadow(color: .black, radius: 15)
                                        .padding(28)
                                }
                            }
                        }
                    }
                }.animation(.easeInOut(duration: 0.5))
            }
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .preferredColorScheme(.light)
            .ignoresSafeArea(.keyboard)
            .background(
                LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom))
    }
}

