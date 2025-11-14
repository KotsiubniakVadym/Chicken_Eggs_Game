//
//  SettingsView.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 14.11.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    
    @Binding var screen: Screen
    
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
                        Text("Setting")
                            .font(.system(size: 40,
                                          weight: .heavy,
                                          design: .monospaced))
                            .minimumScaleFactor(0.8)
                            .foregroundColor(.white)
                            .padding(.top, 30)
                        
                        addedCustomToggle(text: "Sound", value: $viewModel.isSoundEnabled)
                            .padding()
                        
                        addedCustomToggle(text: "Notification", value: $viewModel.isNotificationEnabled)
                            .padding()
                        addedCustomToggle(text: "Vibration", value: $viewModel.isVibrationEnabled)
                            .padding()
                    }
                }
                .padding(.horizontal, 25)
                .padding(.top, 140)
                .padding(.bottom, 80)
                
                Spacer()
                
                Button(action: {
                    viewModel.saveSettings()
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
    }
    
    @ViewBuilder func addedCustomToggle(text: String, value: Binding<Bool>, ) -> some View {
        HStack {
            Text(text)
                .font(.system(size: 20,
                              weight: .heavy,
                              design: .monospaced))
                .minimumScaleFactor(0.8)
                .foregroundColor(.white)
            
            Spacer()
            
            Toggle("", isOn: value)
                .labelsHidden()
                .toggleStyle(SwitchToggleStyle(tint: value.wrappedValue ? .green : .gray))
        }
    }
    
    private func changeScreen(changeScreen: Screen) {
        screen = changeScreen
    }
}
