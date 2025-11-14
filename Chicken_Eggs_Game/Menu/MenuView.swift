//
//  MenuView.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 14.11.2025.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var screen: Screen
    
    var body: some View {
        ZStack{
            Image("Menu_Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                changeScreen(changeScreen: .home)
            }, label: {
                ZStack(alignment: .center) {
                    Image("Back_Button")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .padding(8)
                }
            })
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .topLeading)
            .padding(.leading, 20)
            
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(CustomColor.purpleBackground.color.opacity(0.8))
                    .stroke(CustomColor.purpleOutlineBackground.color, lineWidth: 4)
                
                VStack {
                    Text("MENU")
                        .font(.system(size: 40,
                                      weight: .heavy))
                        .minimumScaleFactor(0.8)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        print("pick profile")
                    }, label: {
                        ZStack(alignment: .center) {
                            Image("Button_Background_Layer")
                                .resizable()
                                .scaledToFit()
                            
                            Text("PROFILE")
                                .font(.system(size: 30,
                                              weight: .heavy,
                                              design: .monospaced))
                                .minimumScaleFactor(0.8)
                                .foregroundColor(.white)
                                .padding(4)
                        }
                    })
                    .padding(.bottom, 10)
                    .padding(.horizontal, 100)
                    
                    Button(action: {
                        print("pick setting")
                    }, label: {
                        ZStack(alignment: .center) {
                            Image("Button_Background_Layer")
                                .resizable()
                                .scaledToFit()
                            
                            Text("Setting")
                                .font(.system(size: 30,
                                              weight: .heavy,
                                              design: .monospaced))
                                .minimumScaleFactor(0.8)
                                .foregroundColor(.white)
                                .padding(4)
                        }
                    })
                    .padding(.horizontal, 100)
                    
                }
                .padding(.top, 30)
                
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
            .padding(.top, 160)
        }
    }
    
    private func changeScreen(changeScreen: Screen) {
        screen = changeScreen
    }
}
