//
//  HomeView.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 13.11.2025.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var screen: Screen
    
    var body: some View {
        ZStack {
            Image("Menu_Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Image("Chicken_Menu")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 40)
            
            VStack {
                ZStack{
                    Button(action: {
                        changeScreen(changeScreen: .menu)
                    }, label: {
                        ZStack(alignment: .center) {
                            Image("Menu_Button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .padding(8)
                        }
                    })
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .topTrailing)
                    .padding(.trailing, 20)
                    
                    Button(action: {
                        changeScreen(changeScreen: .info)
                    }, label: {
                        ZStack(alignment: .center) {
                            Image("Info_Button")
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
                }
                
                Spacer()
                
                Button(action: {
                    changeScreen(changeScreen: .game)
                }, label: {
                    ZStack(alignment: .center) {
                        Image("Button_Background_Layer")
                            .resizable()
                            .scaledToFit()
                        
                        Text("PLAY")
                            .font(.system(size: 60,
                                          weight: .heavy,
                                          design: .monospaced))
                            .minimumScaleFactor(0.8)
                            .foregroundColor(.white)
                            .padding(4)
                    }
                })
                .padding(.bottom, 50)
                .padding(.horizontal, 90)
            }
        }
    }
    
    private func changeScreen(changeScreen: Screen) {
        screen = changeScreen
    }
}
