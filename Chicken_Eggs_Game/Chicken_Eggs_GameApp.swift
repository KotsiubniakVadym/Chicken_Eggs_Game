//
//  Chicken_Eggs_GameApp.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 11.11.2025.
//

import SwiftUI

@main
struct Chicken_Eggs_GameApp: App {
    
    @State private var isLoading: Bool = true
    
    var body: some Scene {
        WindowGroup {
            Group {
                if isLoading {
                    LoadingView(isLoading: $isLoading)
                } else {
                    GameView()
                }
            }
        }
    }
}
