//
//  GameViewModel.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 13.11.2025.
//

import SwiftUI

final class GameViewModel: GameSceneDelegate {
    
    @Binding var screen: Screen
    
    init(screen: Binding<Screen>) {
        _screen = screen
    }
    
    func didGameOver() {
        screen = .home
    }
}
