//
//  LinearProgressView.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 12.11.2025.
//

import SwiftUI

struct LinearProgressView: View {
    
    @Binding var progress: Double
    
    var body: some View {
        ZStack(alignment: .center) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .opacity(0.6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.orange, lineWidth: 2)
                    )
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.red, .orange, .yellow]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 300 * progress, height: 50)
                    .animation(.linear(duration: 0.05), value: progress)
            }
            .frame(width: 300, height: 50)
            
            Text("\(Int(progress * 100))%")
                .foregroundColor(.white)
                .font(.system(size: 20,
                              weight: .heavy,
                              design: .monospaced))
        }
    }
}
