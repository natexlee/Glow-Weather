//
//  ContentView.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/1/21.
//

import SwiftUI



        struct ContentView: View {
            @State var name = "Glowcast"
            @State var selected = "Current"
            //@State var current = CurrentWeather()
            @ObservedObject var nameResponse = nameViewModel()
            @ObservedObject var locationSearch = locationSearchViewModel()
            @ObservedObject var sharedUserInput = SharedUserInput(userUnit: 1, observedCityName: "", clName: "")
            
            var body: some View {
                Home().environmentObject(sharedUserInput)
            }
        }

    

        // tab-items
        var tabItems = ["Current", "Forecast", "Settings"]

        struct Home : View {
            
            @State var selected = "Current"
            
            init() {
                UITabBar.appearance().isHidden = true
           }
            
            @State var centerX : CGFloat = 0
            @State private var selectedChoice = 1
            
            var body: some View {
               
                
                
            VStack(spacing: 0) {
        TabView(selection: $selected){
            CurrentWeather()
                .tag(tabItems[0])
                .ignoresSafeArea(.all, edges: .top)
                //.animation(.easeInOut(duration: 0.45))
            Forecast()
                .tag(tabItems[1])
                .ignoresSafeArea(.all, edges: .top)
            Settings()
                .tag(tabItems[2])
                .ignoresSafeArea(.all, edges: .top)
                    }
                // Custom TabBar
                
                HStack(spacing: 0){
                    
                    ForEach(tabItems,id: \.self){value in
                        
                        GeometryReader {reader in
                            
                            TabBarButton(selected: $selected, value: value, centerX: $centerX, rect: reader.frame(in: .global))
                            
                            //First inital curve
                                
                                .onAppear(perform: {
                                    if value == tabItems.first {
                                        centerX = reader.frame(in: .global).midX
                                    }
                                })
                            
                        }
                        .frame(width: 70, height: 50)
                        
                        if value != tabItems.last{Spacer(minLength: 0)}
                        }
                    }
                .padding(.horizontal,25 )
                .padding(.top)
                .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(Color.black.clipShape(AnimatedShape(centerX: centerX)))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -5 )
                .padding(.top,-15)
            }.ignoresSafeArea(.all, edges: .bottom)
            }
        }

        struct TabBarButton : View {
            
            @Binding var selected : String
            var value: String
            @Binding var centerX : CGFloat
            var rect : CGRect
            
            var body: some View {
                Button(action: {
                    withAnimation(.spring()){
                        selected = value
                        centerX = rect.midX
                    }
                }, label: {
                    VStack {
                        Image(value)
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 26, height: 26)
                            .foregroundColor(selected == value ? Color(.white) : .gray)
                        Text(value)
                            .font(.caption)
                            .foregroundColor(Color(.white))
                            .opacity(selected == value ? 1 : 0 )
                    }
                    
                    // Default Frame For Reading Mid X Axis From Curve
                    .padding(.top)
                    .frame(width: 70, height: 50)
                    .offset(y: selected == value ? -15 : 0)
                })
            }
        }

        //Custom Shape

        struct AnimatedShape: Shape {
            
            var centerX : CGFloat
            
            // Animating Path
            
            var animatableData: CGFloat {
                
                get{return centerX}
                set{centerX = newValue}
            }
            
            func path(in rect: CGRect) -> Path {
                
                return Path{path in
                    
                    path.move(to: CGPoint(x: 0, y: 15))
                    path.addLine(to: CGPoint(x: 0, y: rect.height))
                    path.addLine(to: CGPoint(x: rect.width, y: rect.height))
                    path.addLine(to: CGPoint(x: rect.width, y: 15))
                    
                    //Curve
                    
                    path.move(to: CGPoint(x: centerX - 35, y: 15))
                    
                    path.addQuadCurve(to: CGPoint(x: centerX + 35, y: 15), control: CGPoint(x: centerX, y: -30))
                }
            }
        }


