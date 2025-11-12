//
//  GameView.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 11.11.2025.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    
    let screenWight = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var scene: SKScene {
        let scene = GameScene()
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
