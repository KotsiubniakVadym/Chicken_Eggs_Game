//
//  ProfileView.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 14.11.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showingIconPicker = false
    @Binding var screen: Screen
    
    @StateObject private var viewModel: ProfileViewModel = ProfileViewModel()
    
    var body: some View {
        ZStack {
            Image("Menu_Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                changeScreen(changeScreen: .menu)
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
            
            VStack(alignment: .center) {
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(CustomColor.purpleBackground.color.opacity(0.8))
                        .stroke(CustomColor.purpleOutlineBackground.color, lineWidth: 4)
                    
                    VStack(alignment: .center) {
                        Text("PROFILE")
                            .font(.system(size: 40,
                                          weight: .heavy,
                                          design: .monospaced))
                            .minimumScaleFactor(0.8)
                            .foregroundColor(.white)
                            .padding(.top, 30)
                        
                        Button(action: {
                            showingIconPicker = true
                        }, label: {
                            ZStack {
                                Image("Common_Button_Background")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                
                                Image(viewModel.gender ? "Chicken_Female" : "Chicken_Menu")
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .clipped()
                                    .frame(width: 100, height: 100)
                                    .scaleEffect(1)
                            }
                        })
                        
                        TextField("USERNAME", text: $viewModel.userName)
                            .textFieldStyle(PlainTextFieldStyle())
                            .foregroundColor(.white)
                            .background(CustomColor.purpleOutlineBackground.color)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .font(.system(size: 30, weight: .bold))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(height: 100)
                            .padding(.horizontal, 30)
                            .onChange(of: viewModel.userName) { _, newValue in
                                if newValue.count > 10 {
                                    viewModel.userName = String(newValue.prefix(10))
                                }
                            }
                    }
                }
                .padding(.horizontal, 25)
                .padding(.top, 140)
                .padding(.bottom, 80)
                
                Spacer()
                
                Button(action: {
                    viewModel.saveProfile()
                }, label: {
                    ZStack(alignment: .center) {
                        Image("Button_Background_Layer")
                            .resizable()
                            .scaledToFit()
                        
                        Text("SAVE")
                            .font(.system(size: 60,
                                          weight: .heavy,
                                          design: .monospaced))
                            .minimumScaleFactor(0.8)
                            .foregroundColor(.white)
                            .padding(4)
                    }
                })
                .padding(.bottom, 10)
                .padding(.horizontal, 90)
            }
        }
        .sheet(isPresented: $showingIconPicker) {
            IconPickerView(selectedGender: $viewModel.gender)
                .presentationDetents([.fraction(1/3), .medium])
                .presentationDragIndicator(.visible)
        }
    }
    
    private func changeScreen(changeScreen: Screen) {
        screen = changeScreen
    }
}
