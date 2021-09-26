//
//  ContactInfo.swift
//  Glowing Weather
//
//  Created by Nate Lee on 8/27/21.
//

import SwiftUI

struct ContactInfo: View {
    var body: some View {
        VStack {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.blue), Color(.systemOrange)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(0.85)
                    .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                Text("Contact")
                    .font(.system(size: 55, weight: .semibold, design: .monospaced))
                    .foregroundColor(.white)
                    .shadow(color: .gray, radius: 45)
                    .padding()
            ZStack {
                                
                RoundedRectangle(cornerRadius: 69)
                                    .foregroundColor(.black)
                                    .opacity(0.4)
                                HStack {
                                    Text("twitter: @natexlee")
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
        ZStack {
            
            RoundedRectangle(cornerRadius: 69)
                .foregroundColor(.black)
                .opacity(0.4)
            HStack {
                Text("officialnatelee@gmail.com")
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
            .foregroundColor(.black)
            .font(.system(size: 18, weight: .semibold, design: .monospaced))
            .padding(0.2)
            .padding([.leading, .trailing])
            }
        }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                
                        }
                   }
                    
                }
        }
//        ZStack {
//            LinearGradient(gradient: Gradient(colors: [Color(.blue), Color(.systemOrange)]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .opacity(0.85)
//                .ignoresSafeArea()
//            ScrollView {
//        VStack {
//            Text("Contact")
//                .font(.system(size: 55, weight: .semibold, design: .monospaced))
//                .foregroundColor(.white)
//                .shadow(color: .gray, radius: 45)
//                .padding()
//        Text("officialnatelee@gmail.com")
//            .foregroundColor(.white)
//            .font(.system(size: 20, weight: .regular, design: .monospaced))
//            .multilineTextAlignment(.center)
//            .shadow(color: .black, radius: 15)
//            .padding()
//            Text("twitter: @natexlee")
//                .foregroundColor(.white)
//                .font(.system(size: 20, weight: .regular, design: .monospaced))
//                .multilineTextAlignment(.center)
//                .shadow(color: .black, radius: 15)
//                .padding()
//
//            Spacer()
//                }
//            }
//        }
    }


