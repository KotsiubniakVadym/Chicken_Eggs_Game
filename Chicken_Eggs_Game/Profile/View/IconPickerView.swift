//
//  IconPickerView.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 14.11.2025.
//

import SwiftUI

struct IconPickerView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var selectedGender: Bool
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Choose gender")
                .font(.system(size: 30,
                              weight: .heavy,
                              design: .monospaced))
                .minimumScaleFactor(0.8)
                .foregroundColor(.white)
                .padding(.top, 30)
            
            Button(action: {
                selectedGender = false
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Text("Male")
                        .font(.system(size: 25,
                                      weight: .heavy,
                                      design: .monospaced))
                        .minimumScaleFactor(0.8)
                        .foregroundColor(.black)
                }
                .frame(width: 200, height: 80)
                .background(.white)
                .cornerRadius(10)
            }
            
            Button(action: {
                selectedGender = true
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Text("Female")
                        .font(.system(size: 25,
                                      weight: .heavy,
                                      design: .monospaced))
                        .minimumScaleFactor(0.8)
                        .foregroundColor(.black)
                }
                .frame(width: 200, height: 80)
                .background(.white)
                .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
}
