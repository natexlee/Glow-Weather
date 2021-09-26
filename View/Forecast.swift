//
//  Forecast.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/1/21.
//

import SwiftUI

struct Forecast: View {
    @State var selected = 1
    //var cityInput = CurrentWeather().cityInput
    @State var cityInput = ""
    //@ObservedObject var airWeather = AirViewModel()
    //@ObservedObject var openWeather = openViewModel()
    @State var latitudes = 0.0
    @State var longitudes = 0.0
    @State var searchedLocation = ""
    //@ObservedObject var locationWeather = locationViewModel()
    @ObservedObject var locationManager = LocationManager.shared
    @ObservedObject private var locationXManager = LocationManager()
    @ObservedObject var nameResponse = nameViewModel()
    //@ObservedObject var locationSearch = locationSearchViewModel()
    //@State var searchLX = ""
    @State var viewPicker = 2
    //@ObservedObject var sharedUserInputs = SharedUserInput()
    
    //@State var unit = SharedUserInput().userUnit
    //@State var userInput = SharedUserInput().observedCityName
    @State private var selectedChoice: Int = 1
     //var currentView = CurrentWeather()
    //@StateObject var userInput: SharedUserInput
    @EnvironmentObject var sharedUserInput: SharedUserInput
    @State var locationToName = ""
    
    //var postalCode = LocationManager.shared.postalCode
       @State var locationParam = ""
    
    //Name Search
        var maxTemp: Double {
            if sharedUserInput.userUnit == 1 {
                return nameResponse.maxTemp
            } else {
                return (nameResponse.maxTemp - 32) * 0.5556
            }
        }
    //Name Search
    var minTemp: Double {
        if sharedUserInput.userUnit == 1 {
            return nameResponse.minTemp
        } else {
            return (nameResponse.minTemp - 32) * 0.5556
        }
    }
    
    //Name Search
    var avgTemp: Double {
        if sharedUserInput.userUnit == 1 {
            return nameResponse.avgTemp
        } else {
            return (nameResponse.avgTemp - 32) * 0.5556
        }
    }
    
    //Name Search
    var wsConverted: Double {
        if sharedUserInput.userUnit == 1 {
            return nameResponse.maxWind
        } else {
            return nameResponse.maxWind * 1.609344
        }
    }
    
    //Name Search
    var wsConverted1: Double {
        if sharedUserInput.userUnit == 1 {
            return nameResponse.maxWind1
        } else {
            return nameResponse.maxWind1 * 1.609344
        }
    }
    
    //Universal Unit
    var windUnit: String {
        if sharedUserInput.userUnit == 1 {
              return "MPH"
        } else {
            return "KPH"
        }
    }
    
    //Universal Unit
    var tempConvert1: Double {
        if sharedUserInput.userUnit == 1 {
            return 0.0
        } else {
            return -32.0
        }
    }
    
    //Universal Unit
    var tempConvert2: Double {
        if sharedUserInput.userUnit == 1 {
            return 1.0
        } else {
            return 0.5556
        }
    }
    
    // Location Search
//    var maxTempLocation: Double {
//        if sharedUserInput.userUnit == 1 {
//            return locationSearch.maxTemp0
//        } else {
//            return (locationSearch.maxTemp0 - 32) * 0.5556
//        }
//    }
    
    //Name Search
    var iconImage: String {
        switch nameResponse.code {
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
    
    //Name Search
    var iconImage1: String {
        switch nameResponse.code1 {
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
    
    //Location Search
//    var locationIconImage: String {
//        switch locationSearch.Code {
//        case 1000: return "sun.max.fill"
//        case 1003: return "cloud.sun.fill"
//        case 1006: return "cloud.fill"
//        case 1030, 1063, 1150, 1153, 1240: return "cloud.drizzle.fill"
//        case 1180, 1183, 1186, 1189, 1243: return "cloud.rain.fill"
//        case 1192, 1195, 1246: return "cloud.heavyrain.fill"
//        case 1087, 1279, 1282: return "cloud.bolt.fill"
//        case 1114: return "wind.snow"
//        case 1117, 1219, 1222, 1225, 1258: return "cloud.snow.fill"
//        case 1135, 1147: return "cloud.fog.fill"
//        case 1069, 1072, 1168, 1171, 1198, 1201, 1204, 1207, 1249, 1252: return "cloud.sleet.fill"
//        case 1066, 1210, 1213, 1216, 1255: return "snow"
//        case 1009: return "sun.haze.fill"
//        case 1237, 1261, 1264: return "cloud.hail.fill"
//        case 1273, 1276: return "cloud.bolt.rain.fill"
//        default: return "cloud.fill"
//        }
//    }
    
    //Location Search
//    var locationIconImageF: String {
//        switch locationSearch.locationCode {
//        case 1000: return "sun.max.fill"
//        case 1003: return "cloud.sun.fill"
//        case 1006: return "cloud.fill"
//        case 1030, 1063, 1150, 1153, 1240: return "cloud.drizzle.fill"
//        case 1180, 1183, 1186, 1189, 1243: return "cloud.rain.fill"
//        case 1192, 1195, 1246: return "cloud.heavyrain.fill"
//        case 1087, 1279, 1282: return "cloud.bolt.fill"
//        case 1114: return "wind.snow"
//        case 1117, 1219, 1222, 1225, 1258: return "cloud.snow.fill"
//        case 1135, 1147: return "cloud.fog.fill"
//        case 1069, 1072, 1168, 1171, 1198, 1201, 1204, 1207, 1249, 1252: return "cloud.sleet.fill"
//        case 1066, 1210, 1213, 1216, 1255: return "snow"
//        case 1009: return "sun.haze.fill"
//        case 1237, 1261, 1264: return "cloud.hail.fill"
//        case 1273, 1276: return "cloud.bolt.rain.fill"
//        default: return "cloud.fill"
//        }
//    }
    
    var body: some View {
        
        //Fetch user coordinates within forecast view
//        let coordinate = self.locationXManager.userLocation != nil ?
//        self.locationXManager.userLocation!.coordinate :
//            locationManager.twoD
        
        //let coordinates = "\(coordinate.latitude),\(coordinate.longitude)"

        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.blue), Color(.systemOrange)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.85)
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
        VStack {
            Spacer(minLength: 80)
//            Text("Have a great day!")
//                .padding(10).onAppear {
//
//                }
//            HStack {
//        Spacer()
//                //Text("Location \(postalCode)")
//        Button(action: {
//            viewPicker = 1
//            hideKeyboard()
//            LocationManager.shared.requestLocation()
////            self.nameResponse.fetchData(cityInput: postalCode)
//            self.nameResponse.fetchData(cityInput: coordinates)
//
//
////            self.locationSearch.fetchData(latitude: coordinate.latitude, longitude: coordinate.longitude)
////            sharedUserInput.clName = locationSearch.Name
////            self.nameResponse.fetchData(cityInput: sharedUserInput.clName)
//
//
//
//
//
//            //self.reverseGeo.fetchData(latitude: coordinate.latitude, longitude: coordinate.longitude)
//        }, label: {
//            Image(systemName: "location.circle")
//                .resizable()
//                .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .foregroundColor(.white)
//                .padding()
//        })
//            }
            
//            if sharedUserInput.observedCityName != "" {
//                let locationParam = sharedUserInput.observedCityName
//            } else {
//                let locationParam = coordinates
//            }
            
            //User Prompt
            if nameResponse.lat == 0.0000 {
                
                VStack {
                    
                    if sharedUserInput.observedCityName != "" {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color("GradientColorBlue"))
                            .opacity(0.65)
                            .shadow(color: .black, radius: 15)
                        HStack {
                            Text("Refresh Forecast")
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding()
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .heavy, design: .monospaced))
                        .padding(0.2)
                        .padding([.leading, .trailing])
                        }
                    }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.top, 200)
//                            .padding(.horizontal, 25)
                        .padding()
                            .onTapGesture {
                                viewPicker = 1
                                self.nameResponse.fetchData(cityInput: sharedUserInput.observedCityName)
                            }
                    }
                    
                    if sharedUserInput.observedCityName == "" {
//                        NavigationView {
//                            NavigationLink {
//                                CurrentWeather()
//                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25)
                                        .foregroundColor(.black)
                                        .opacity(0.4)
                                    HStack {
                                        Text("Search location or use current location")
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
                                        .padding(.top, 65)
                                        .padding(.horizontal, 25)
                                        .onTapGesture {
                                            viewPicker = 1
                                            self.nameResponse.fetchData(cityInput: sharedUserInput.observedCityName)
                        }
                }
                }
            }

            if viewPicker == 1 && nameResponse.lat != 0.0000 {
                VStack {
                    Text("\(nameResponse.name)")
                .foregroundColor(.white)
                .font(.system(size: 38, weight: .semibold, design: .monospaced))
                .multilineTextAlignment(.center)
                .shadow(color: .black, radius: 30)
                .padding(.top, 10)
                .padding(10)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Group {
                    Text("\(nameResponse.region)")
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
                                .opacity(0.3)
                                .shadow(color: Color(.gray), radius: 18)
                            Text("Min: \(Int((nameResponse.minTemp + tempConvert1) * tempConvert2))º Max: \(Int((nameResponse.maxTemp + tempConvert1) * tempConvert2))º")
                            .font(.system(size: 25, weight: .medium, design: .monospaced))
                            .foregroundColor(.white)
                        }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(0.2)
                        .padding([.leading, .trailing])
                            ZStack {
                                RoundedRectangle(cornerRadius: 38.0)
                                    .foregroundColor(Color(.black))
                                    .opacity(0.3)
                                    .shadow(color: Color(.gray), radius: 18)
                                Text("Average Temp: \(Int((nameResponse.avgTemp + tempConvert1) * tempConvert2))º")
                                .font(.system(size: 25, weight: .medium, design: .monospaced))
                                .foregroundColor(.white)
                            }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(0.2)
                            .padding([.leading, .trailing])
                            ZStack {
                                RoundedRectangle(cornerRadius: 38.0)
                                    .foregroundColor(Color(.black))
                                    .opacity(0.3)
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
                                    .opacity(0.3)
                                    .shadow(color: Color(.gray), radius: 18)
                                Text("Chance Of Rain: \(nameResponse.chanceOfRain)%")
                                .font(.system(size: 25, weight: .medium, design: .monospaced))
                                .foregroundColor(.white)
                            }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(0.2)
                            .padding([.leading, .trailing])
                            ZStack {
                                RoundedRectangle(cornerRadius: 38.0)
                                    .foregroundColor(Color(.black))
                                    .opacity(0.3)
                                    .shadow(color: Color(.gray), radius: 18)
                                Text("Chance Of Snow: \(nameResponse.chanceOfSnow)%")
                                .font(.system(size: 25, weight: .medium, design: .monospaced))
                                .foregroundColor(.white)
                            }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(0.2)
                            .padding([.leading, .trailing])
                        }
                    VStack {
                        Text("Tomorrow")
                    .foregroundColor(.white)
                    .font(.system(size: 35, weight: .bold, design: .monospaced))
                    .multilineTextAlignment(.center)
                    .shadow(color: .black, radius: 12)
                    .padding(.top)
                    .padding(.horizontal)
                        Group {
                            Image(systemName: "\(iconImage1)")
                                .renderingMode(.original)
                                .font(.system(size: 170))
                                .foregroundColor(Color.white)
                                .shadow(color: .black, radius: 45)
                                .padding(.trailing, 6)
                            ZStack {
                                RoundedRectangle(cornerRadius: 38.0)
                                    .foregroundColor(Color(.black))
                                    .opacity(0.3)
                                    .shadow(color: Color(.gray), radius: 18)
                                Text("Min: \(Int((nameResponse.minTemp1 + tempConvert1) * tempConvert2))º Max: \(Int((nameResponse.maxTemp1 + tempConvert1) * tempConvert2))º")
                                .font(.system(size: 25, weight: .medium, design: .monospaced))
                                .foregroundColor(.white)
                            }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(0.2)
                            .padding([.leading, .trailing])
                                ZStack {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color(.black))
                                        .opacity(0.3)
                                        .shadow(color: Color(.gray), radius: 18)
                                    Text("Average Temp: \(Int((nameResponse.avgTemp1 + tempConvert1) * tempConvert2))º")
                                    .font(.system(size: 25, weight: .medium, design: .monospaced))
                                    .foregroundColor(.white)
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(0.2)
                                .padding([.leading, .trailing])
                                ZStack {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color(.black))
                                        .opacity(0.3)
                                        .shadow(color: Color(.gray), radius: 18)
                                    Text("Max Wind: \(Int(wsConverted1)) \(windUnit)")
                                    .font(.system(size: 25, weight: .medium, design: .monospaced))
                                    .foregroundColor(.white)
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(0.2)
                                .padding([.leading, .trailing])
                                ZStack {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color(.black))
                                        .opacity(0.3)
                                        .shadow(color: Color(.gray), radius: 18)
                                    Text("Chance Of Rain: \(nameResponse.chanceOfRain1)%")
                                    .font(.system(size: 25, weight: .medium, design: .monospaced))
                                    .foregroundColor(.white)
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(0.2)
                                .padding([.leading, .trailing])
                                ZStack {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color(.black))
                                        .opacity(0.3)
                                        .shadow(color: Color(.gray), radius: 18)
                                    Text("Chance Of Snow: \(nameResponse.chanceOfSnow1)%")
                                    .font(.system(size: 25, weight: .medium, design: .monospaced))
                                    .foregroundColor(.white)
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(0.2)
                                .padding([.leading, .trailing])
                            Text("Updated: \(nameResponse.localtime)")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold, design: .monospaced))
                            .shadow(color: .black, radius: 15)
                            .padding(28)
                        }
                   
                }
                
            }
      
            }
        }
            }
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                viewPicker = 1
                self.nameResponse.fetchData(cityInput: sharedUserInput.observedCityName)
            })
        .preferredColorScheme(.light)
        .ignoresSafeArea(.keyboard)
        }
    }




