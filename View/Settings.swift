//
//  Settings.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/1/21.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var sharedUserInput: SharedUserInput
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.ignoresSafeArea().opacity(0.5)
                VStack(alignment: .center) {
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("Settings")
                            .font(.system(size: 55, weight: .heavy, design: .monospaced))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 30)
                            .padding()
                            .padding(.bottom, 1)
                        NavigationLink(
                            destination: AboutTheApp(),
                            label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color("GradientColorBlue"))
                                        .opacity(1)
                                        .shadow(color: Color(.black), radius: 23)
                                    Text("About The App")
                                        .font(.system(size: 30, weight: .medium, design: .monospaced))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 10)
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(.horizontal)
                                    .padding(.bottom, 5)
                            })
                        NavigationLink(
                            destination: AboutAirQuality(),
                            label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color("GradientColorBlue"))
                                        .opacity(1)
                                        .shadow(color: Color(.black), radius: 23)
                                    Text("Air Quality Info")
                                        .font(.system(size: 30, weight: .medium, design: .monospaced))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 10)
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(.horizontal)
                                    .padding(.bottom, 5)
                            })
                        NavigationLink(
                            destination: ContactInfo(),
                            label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 38.0)
                                        .foregroundColor(Color("GradientColorBlue"))
                                        .opacity(1)
                                        .shadow(color: Color(.black), radius: 23)
                                    Text("Contact Developer")
                                        .font(.system(size: 30, weight: .medium, design: .monospaced))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 10)
                                }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(.horizontal)
                                    .padding(.bottom, 5)
                            })
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(.black)
                                .opacity(0.6)
                                .shadow(color: .black, radius: 15)
                            VStack {
                                Text("Temp Unit")
                                    .font(.system(size: 30, weight: .semibold, design: .monospaced))
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 15)
                                    .padding(.top)
                                HStack {
                                    Text("")
                                        .padding()
                                    VStack {
                                        Picker(selection: $sharedUserInput.userUnit, label: Text("Picker"), content: {
                                            Text("Fahrenheit").tag(1)
                                            Text("Celsius").tag(2)
                                        })
                                        
                                            .pickerStyle(SegmentedPickerStyle())
                                            .shadow(color: .blue, radius: 10)
                                    }.padding(.bottom)
                                    Text("")
                                        .padding()
                                }
                            }
                        }.padding()
                            .padding(.bottom, 60)
                        Text("")
                            .padding()
                    }.opacity(0.85)
                }
                Spacer()
            }
            
        }
    }
}

