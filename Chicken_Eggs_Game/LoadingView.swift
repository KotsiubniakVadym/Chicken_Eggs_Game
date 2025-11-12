//
//  LoadingView.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 12.11.2025.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var progress: Double = 0.0
    @State private var timer: Timer? = nil
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack {
            Image("Menu_Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Image("Chicken_Menu")
                .resizable()
                .scaledToFit()
            
            VStack {
                Spacer()
                LinearProgressView(progress: $progress)
                    .padding(.bottom, 100)
            }
        }
        .onAppear {
            // Mock loading
            startProgressAnimation()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    func startProgressAnimation() {
       timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            if progress < 1.0 {
                progress = min(progress + 0.01, 1.0)
            } else {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isLoading = false
                }
            }
        }
    }
}
