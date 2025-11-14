//
//  InfoView.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 14.11.2025.
//

import SwiftUI

struct InfoView: View {
    
    @Binding var screen: Screen
    
    private var viewModel: InfoViewModel
    
    init(screen: Binding<Screen>, viewModel: InfoViewModel) {
        _screen = screen
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
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
                    .fill(CustomColor.purpleBackground.color)
                    .opacity(0.8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(CustomColor.purpleOutlineBackground.color, lineWidth: 4)
                    )
                
                VStack(alignment: .center) {
                    Text("How to play")
                        .font(.system(size: 40,
                                      weight: .heavy,
                                      design: .monospaced))
                        .minimumScaleFactor(0.8)
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    Text(viewModel.explanationGameText)
                        .font(.system(size: 16,
                                      weight: .bold))
                        .foregroundColor(.white)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 5)
                }
            }
            .padding(.horizontal, 40)
            .padding(.top, 140)
            .padding(.bottom, 20)
        }
    }
    
    private func changeScreen(changeScreen: Screen) {
        screen = changeScreen
    }
}
