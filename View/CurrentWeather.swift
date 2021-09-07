//
//  CurrentWeather.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/1/21.
//

import SwiftUI
import Foundation

struct CurrentWeather: View {
    @State var cityInput = ""
    @ObservedObject var openWeather = openViewModel()
    @State var selected = 1
    
    var tempToCelsius: Double {
        if selected == 1 {
           return openWeather.temp
        } else {
            return (openWeather.temp - 32) * 0.5556
        }
    }
    
    var feelsLikeToCelsius: Double {
        if selected == 1 {
           return openWeather.feels_like
        } else {
            return (openWeather.feels_like - 32) * 0.5556
        }
    }
    
    var wsConverted: Double {
        if selected == 1 {
              return openWeather.windSpeed
        } else {
            return openWeather.windSpeed * 1.609344
        }
    }
    
    var windUnit: String {
        if selected == 1 {
              return "MPH"
        } else {
            return "KPH"
        }
    }
    
    var minTempConverted: Double {
        if selected == 1 {
           return openWeather.tempMin
        } else {
            return (openWeather.tempMin - 32) * 0.5556
        }
    }
    
    var maxTempConverted: Double {
        if selected == 1 {
           return openWeather.tempMax
        } else {
            return (openWeather.tempMax - 32) * 0.5556
        }
    }
    
    var iconImage: String {
        switch openWeather.icon {
        case "01d": return "sun.max.fill"
        case "01n": return "moon.stars.fill"
        case "02d": return "cloud.sun.fill"
        case "02n": return "cloud.moon.fill"
        case "03n", "03d": return "cloud.fill"
        case "04d", "04n": return "smoke.fill"
        case "09d", "09n": return "cloud.drizzle.fill"
        case "10d": return "cloud.sun.rain.fill"
        case "10n": return "cloud.moon.rain.fill"
        case "11d": return "cloud.sun.bolt.fill"
        case "11n": return "cloud.moon.bolt.fill"
        case "13d", "13n": return "snow"
        case "50d": return "sun.haze.fill"
        case "50n": return "cloud.fog.fill"
        default: return "cloud.fill"
        }
    }
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.black), Color(.gray)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ScrollView(.vertical) {
        VStack {
            HStack {
                Button(action: {
                    self.openWeather.fetchData(cityInput: cityInput)
                    hideKeyboard()
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .padding(.leading)
                })
                TextField("Search City", text: $cityInput, onCommit: {
                    self.openWeather.fetchData(cityInput: cityInput)
                })
                    .extensionTextFieldView(roundedCornes: 38, startColor: .white, endColor: Color("GradientColorBlue"))
                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                .padding()
            }.padding(.top, 30)
            if openWeather.temp != 0.0000 {
                Text("\(openWeather.name), \(openWeather.country)")
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .semibold, design: .monospaced))
                .shadow(color: .black, radius: 15)
                Image(systemName: "\(iconImage)")
                    .renderingMode(.original)
                    .font(.system(size: 175))
                    .foregroundColor(Color.white)
                    .shadow(color: .white, radius: 85)
            Group {
                Text("\(Int(tempToCelsius))º")
                .foregroundColor(.white)
                .font(.system(size: 55, weight: .semibold, design: .monospaced))
                .shadow(color: .black, radius: 15)
                .padding()
                Text("\((openWeather.weatherDescription).capitalized)")
                    .foregroundColor(.white)
                    .font(.system(size: 35, weight: .heavy, design: .monospaced))
                    .shadow(color: .black, radius: 15)
                    .padding()
                HStack {
                    Text("")
                        .padding()
                VStack {
                    Picker(selection: $selected, label: Text("Picker"), content: {
                        Text("Fahrenheit").tag(1)
                        Text("Celsius").tag(2)
                    })
                    
                    .pickerStyle(SegmentedPickerStyle())
                    .shadow(color: .blue, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                    Text("")
                        .padding()
            }
                Text("Pressure: \(openWeather.pressure) hPa")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .shadow(color: .black, radius: 15)
                    .padding()
                Text("Wind Speed: \(Int(wsConverted)) \(windUnit)")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                .shadow(color: .black, radius: 15)
                .padding()
                Text("Feels Like: \(Int(feelsLikeToCelsius))º")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .shadow(color: .black, radius: 15)
                    .padding()
                Text("Humidity: \(openWeather.humidity)%")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .shadow(color: .black, radius: 15)
                    .padding()
                Text("Min Temp: \(Int(minTempConverted))º")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .shadow(color: .black, radius: 15)
                    .padding()
                Text("Max Temp: \(Int(maxTempConverted))º")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .shadow(color: .black, radius: 15)
                    .padding()
                Text("Clouds: \(openWeather.clouds)%")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .shadow(color: .black, radius: 15)
                    .padding()
        }
            Spacer()
            }
            }
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
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


