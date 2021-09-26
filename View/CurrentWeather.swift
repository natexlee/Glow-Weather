//
//  CurrentWeather.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/1/21.
//

import SwiftUI
import Foundation
import CoreLocation



struct CurrentWeather: View {
    @State var cityInput = ""
    @State var latitudes = 0.0
    @State var longitudes = 0.0
    @ObservedObject var locationManager = LocationManager.shared
    @ObservedObject private var locationXManager = LocationManager()
    @ObservedObject var nameResponse = nameViewModel()
    @State var searchLX = ""
    @State var viewPicker = 1
    @EnvironmentObject var sharedUserInput: SharedUserInput
    
    
    var tempToCelsius: Double {
        if sharedUserInput.userUnit == 1 {
           return nameResponse.temp_f
        } else {
            return (nameResponse.temp_f - 32) * 0.5556
        }
    }
    
    
    var feelsLikeToCelsius: Double {
        if sharedUserInput.userUnit == 1 {
            return nameResponse.feelslike_f
        } else {
            return (nameResponse.feelslike_f - 32) * 0.5556
        }
    }
    
    var wsConverted: Double {
        if sharedUserInput.userUnit == 1 {
            return nameResponse.wind_mph
        } else {
            return nameResponse.wind_mph * 1.609344
        }
    }
    
    var windUnit: String {
        if sharedUserInput.userUnit == 1 {
              return "MPH"
        } else {
            return "KPH"
        }
    }
    
    
    var pressureConverted: Double {
        return nameResponse.pressure_in * 33.86
    }
    
    var pressureConvertedX: Double {
        return nameResponse.pressure_in * 33.86
    }
    
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
    
    
    
 
    var body: some View {
        
        
            let coordinate = self.locationXManager.userLocation != nil ?
            self.locationXManager.userLocation!.coordinate :
            CLLocationCoordinate2D()
        
            let coordinates = "\(coordinate.latitude),\(coordinate.longitude)"
        
        //Location Request Test
 
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color(.blue), Color(.systemOrange)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.85)
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
//                let latitudes = coordinate.latitude
//                let longitudes = coordinate.longitude
                
            VStack {
            HStack {
                Button(action: {
                    viewPicker = 1
                    hideKeyboard()
                    sharedUserInput.observedCityName = cityInput
                        self.nameResponse.fetchData(cityInput: sharedUserInput.observedCityName)
                }, label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.white)
                    .padding(.leading)
                    })
                ZStack {
                    TextField("Search City", text: $cityInput, onCommit: {
                        viewPicker = 1
                        hideKeyboard()
                        sharedUserInput.observedCityName = cityInput
                            self.nameResponse.fetchData(cityInput: sharedUserInput.observedCityName)
                }).extensionTextFieldView(roundedCornes: 38, startColor: .white, endColor: Color("GradientColorBlue"))
                .preferredColorScheme(.light)
                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                .foregroundColor(.black)
                .padding()
                    HStack {
                Spacer()
                Button(action: {
                    hideKeyboard()
                    viewPicker = 1
                    sharedUserInput.observedCityName = coordinates
                    self.nameResponse.fetchData(cityInput: coordinates)
                }, label: {
                    Image(systemName: "location.circle")
                        .resizable()
                        .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding()
                }).padding()
                    }
                }
            }.padding(.top, 30).onAppear(perform: {
                LocationManager.shared.requestLocation()
            })
                
                //Prompt displayed when no data is available
                if nameResponse.lat == 0.0000 {
                    VStack {
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
                                sharedUserInput.observedCityName = coordinates
                                self.nameResponse.fetchData(cityInput: sharedUserInput.observedCityName)
                            }
                    }
                }
                
                if nameResponse.lat != 0.0000 && viewPicker == 1 {
                    VStack {
                    Text("\(nameResponse.name)")
                .foregroundColor(.white)
                .font(.system(size: 38, weight: .semibold, design: .monospaced))
                .multilineTextAlignment(.center)
                .shadow(color: .black, radius: 30)
                .padding(.top)
                .padding(.horizontal)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
                        VStack {
                        Text("\(Int(tempToCelsius))º")
                            .foregroundColor(.white)
                            .font(.system(size: 80, weight: .medium, design: .monospaced))
                            .shadow(color: .black, radius: 15)
                            .padding(.leading, 10)
                        }.padding(0.5)
                        ZStack {
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundColor(.black)
                                .opacity(0.3)
                        Text("\(nameResponse.text)")
                        .font(.system(size: 32, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .shadow(color: .black, radius: 15)
                            .padding()
                        }.padding(.horizontal)
                    }
                    Group {
                        ZStack {
                            RoundedRectangle(cornerRadius: 38.0)
                                .foregroundColor(Color(.black))
                                .opacity(0.3)
                                .shadow(color: Color(.gray), radius: 18)
                        Text("Pressure: \(Int(pressureConverted)) hPa")
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
                        Text("Wind Speed: \(Int(wsConverted)) \(windUnit)")
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
                        Text("Feels Like: \(Int(feelsLikeToCelsius))º")
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
                        Text("Humidity: \(nameResponse.humidity)%")
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
                        Text("UV Index: \(nameResponse.uv)")
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
                        Text("Clouds: \(nameResponse.cloud)%")
                            .font(.system(size: 25, weight: .medium, design: .monospaced))
                            .foregroundColor(.white)
                            
                        }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(0.2)
                        .padding([.leading, .trailing])

                        if nameResponse.lat != 0.0000 && viewPicker == 1 {
                            Text("Air Quality")
                        .foregroundColor(.white)
                        .font(.system(size: 38, weight: .bold, design: .monospaced))
                        .multilineTextAlignment(.center)
                        .shadow(color: .black, radius: 15)
                        .padding(.top)
                        .padding(.horizontal)
                            
                            if nameResponse.co != 0.0000000 {
                                // Carbon Monoxide
                                ZStack {
                                    if 0.0...5263.69 ~= nameResponse.co  {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color("customLightGreen"))
                                        .opacity(0.6)
                                        .shadow(color: Color(.black), radius: 12)
                                    } else if 5263.70...11185.93 ~= nameResponse.co {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color("customLightYellow"))
                                            .opacity(0.6)
                                            .shadow(color: Color(.black), radius: 12)
                                    } else {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color("customLightRed"))
                                            .opacity(0.6)
                                            .shadow(color: Color(.black), radius: 12)
                                    }
                                    
                                    HStack {
                                        Text("Co: \(nameResponse.co, specifier: "%.2f") µg/m3")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                                    .shadow(color: .white, radius: 15)
                                    .padding()
                                    }
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(0.2)
                                .padding([.leading, .trailing])
                                
                                // No2
                                
                                ZStack {
                                    if 0...151 ~= nameResponse.no2  {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color("customLightGreen"))
                                        .opacity(0.6)
                                        .shadow(color: Color(.black), radius: 12)
                                    } else if 152...205 ~= nameResponse.no2 {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color("customLightYellow"))
                                            .opacity(0.6)
                                            .shadow(color: Color(.black), radius: 12)
                                    } else {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color("customLightRed"))
                                            .opacity(0.6)
                                            .shadow(color: Color(.black), radius: 12)
                                    }
                                    
                                    HStack {
                                        Text("No2: \(nameResponse.no2, specifier: "%.2f") µg/m3")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                                    .shadow(color: .white, radius: 15)
                                    .padding()
                                    }
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(0.2)
                                .padding([.leading, .trailing])
                                
                                
                                // o3
                                
                                ZStack {
                                    if 0...116 ~= nameResponse.o3  {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color("customLightGreen"))
                                        .opacity(0.6)
                                        .shadow(color: Color(.black), radius: 12)
                                    } else if 117...150 ~= nameResponse.o3 {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color("customLightYellow"))
                                            .opacity(0.6)
                                            .shadow(color: Color(.black), radius: 12)
                                    } else {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color("customLightRed"))
                                            .opacity(0.6)
                                            .shadow(color: Color(.black), radius: 12)
                                    }
                                    
                                    HStack {
                                        Text("o3: \(nameResponse.o3, specifier: "%.2f") µg/m3")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                                    .shadow(color: .white, radius: 15)
                                    .padding()
                                    }
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(0.2)
                                .padding([.leading, .trailing])
                                
                               
                                // Sulfur dioxide
                                
                                ZStack {
                                    if 0...99 ~= nameResponse.so2  {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color("customLightGreen"))
                                        .opacity(0.6)
                                        .shadow(color: Color(.black), radius: 12)
                                    } else if 100...214 ~= nameResponse.so2 {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color("customLightYellow"))
                                            .opacity(0.6)
                                            .shadow(color: Color(.black), radius: 12)
                                    } else {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color("customLightRed"))
                                            .opacity(0.6)
                                            .shadow(color: Color(.black), radius: 12)
                                    }
                                    
                                    HStack {
                                        Text("So2: \(nameResponse.so2, specifier: "%.2f") µg/m3")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                                    .shadow(color: .white, radius: 15)
                                    .padding()
                                    }
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(0.2)
                                .padding([.leading, .trailing])
                                

                                // Particulate Matter (2.5 Microns)
                                
                                ZStack {
                                    if 0.0...12.0 ~= nameResponse.pm2_5  {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color("customLightGreen"))
                                        .opacity(0.6)
                                        .shadow(color: Color(.black), radius: 12)
                                    } else if 12.1...35.4 ~= nameResponse.pm2_5 {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color("customLightYellow"))
                                            .opacity(0.6)
                                            .shadow(color: Color(.black), radius: 12)
                                    } else {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color("customLightRed"))
                                            .opacity(0.6)
                                            .shadow(color: Color(.black), radius: 12)
                                    }
                                    
                                    HStack {
                                        Text("Pm(2.5): \(nameResponse.pm2_5, specifier: "%.2f") µg/m3")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                                    .shadow(color: .white, radius: 15)
                                            .padding(.horizontal)
                                    }
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(0.2)
                                .padding([.leading, .trailing])
                                

                              // Particulate Matter (10 Microns)
                                
                                ZStack {
                                    if 0...54.0 ~= nameResponse.pm10  {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color("customLightGreen"))
                                        .opacity(0.6)
                                        .shadow(color: Color(.black), radius: 12)
                                    } else if 55.0...154.0 ~= nameResponse.pm10 {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color("customLightYellow"))
                                            .opacity(0.6)
                                            .shadow(color: Color(.black), radius: 12)
                                    } else {
                                        RoundedRectangle(cornerRadius: 38.0)
                                            .foregroundColor(Color("customLightRed"))
                                            .opacity(0.6)
                                            .shadow(color: Color(.black), radius: 12)
                                    }
                                    
                                    HStack {
                                        Text("Pm(10): \(nameResponse.pm10, specifier: "%.2f") µg/m3")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                                    .shadow(color: .white, radius: 15)
                                    .padding()
                                    }
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(0.2)
                                .padding([.leading, .trailing])
                            }
                            Text("Updated: \(nameResponse.localtime)")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold, design: .monospaced))
                            .shadow(color: .black, radius: 15)
                            .padding()
                        }
                    }
                }
            }
                Spacer()
            
            }
            
            
            }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                
                if sharedUserInput.observedCityName != "" {
                    viewPicker = 1
                    self.nameResponse.fetchData(cityInput: sharedUserInput.observedCityName)
                } else {
                    viewPicker = 1
                    self.nameResponse.fetchData(cityInput: sharedUserInput.clName)
                }
            })
        .preferredColorScheme(.light)
    }
}


        

    







func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
        to: nil,
        from: nil,
        for: nil
    )
}



extension TextField {

func extensionTextFieldView(roundedCornes: CGFloat, startColor: Color,  endColor: Color) -> some View {
    self
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(roundedCornes)
        .shadow(color: Color(.blue), radius: 11)
    }
}





