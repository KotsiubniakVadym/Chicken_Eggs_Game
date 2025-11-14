//
//  Chicken_Eggs_GameApp.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 11.11.2025.
//

import SwiftUI

@main
struct Chicken_Eggs_GameApp: App {
    
    @State private var screen: Screen = .loading
    
    var body: some Scene {
        WindowGroup {
            switch screen {
            case .loading:
                LoadingView(screen: $screen)
            case .home:
                HomeView(screen: $screen)
            case .game:
                GameView(viewModel: .init(screen: $screen))
            case .menu:
                MenuView(screen: $screen)
            case .info:
                InfoView(screen: $screen, viewModel: .init())
            case .setting:
                SettingsView(screen: $screen)
            case .profile:
                ProfileView(screen: $screen)
            }
        }
    }
}
