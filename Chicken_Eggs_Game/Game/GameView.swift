//
//  GameView.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 11.11.2025.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    
    private var viewModel: GameViewModel
    private let screenWight = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
    }
    
    var scene: SKScene {
        let scene = GameScene()
        scene.gameDelegate = viewModel
        scene.size = CGSize(width: screenWight, height: screenHeight)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene)
        }
    }
}
