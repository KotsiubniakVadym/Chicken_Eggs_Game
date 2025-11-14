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
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.orange, lineWidth: 4)
                .frame(width: 303, height: 53)
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                Rectangle()
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
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(width: 300, height: 50)
            
            Text("\(Int(progress * 100))%")
                .foregroundColor(.white)
                .font(.system(size: 20,
                              weight: .heavy,
                              design: .monospaced))
        }
    }
}
