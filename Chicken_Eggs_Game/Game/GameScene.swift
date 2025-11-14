//
//  GameScene.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 11.11.2025.
//

import SpriteKit
import GameplayKit

protocol GameSceneDelegate: AnyObject {
    func didGameOver()
}

final class GameScene: SKScene, SKPhysicsContactDelegate {
    
    weak var gameDelegate: GameSceneDelegate?
    
    private var timeIntervalEggsDrop: TimeInterval = 2.0
    private var score = 0
    private var scoreLabel: SKLabelNode!
    private let background = SKSpriteNode(imageNamed: "Game_Background")
    private var spawnTimer: Timer?
    private var fallenEggsCount = 0
    
    override func didMove(to view: SKView) {
        
        addBackground()
        addScoreLabel()
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -1)
        physicsWorld.contactDelegate = self
        
        // Create eggs node
        spawnTimer = Timer.scheduledTimer(timeInterval: timeIntervalEggsDrop, target: self, selector: #selector(spawnEggs), userInfo: nil, repeats: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            // Check is node which touched user is egg
            if touchedNode.name == "egg" || (touchedNode as? SKSpriteNode)?.texture?.description.contains("Eggs") == true {
                touchedNode.removeFromParent()
                
                score += 1
                scoreLabel.text = "Score: \(score)"
                if score == 20 {
                    gameOver()
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        //TODO: - create logic when user lost
        for node in children {
            if node.position.y < frame.minY - 50 {
                if node.name == "egg" {
                    fallenEggsCount += 1
                }
                node.removeFromParent()
                if fallenEggsCount >= 3 {
                    gameOver()
                }
            }
        }
    }
    
    deinit {
        spawnTimer?.invalidate()
    }
    
    @objc func spawnEggs() {
        let numberOfEggs = Int.random(in: 1...3)
        
        for _ in 0..<numberOfEggs {
            
            let egg = SKSpriteNode(imageNamed: "Green_Egg")
            egg.name = "egg"
            egg.size = CGSize(width: 50, height: 70)
            
            let randomX = CGFloat.random(in: 50...frame.width - 50)
            egg.position = CGPoint(x: randomX, y: frame.maxY + egg.size.height)
            
            egg.physicsBody = SKPhysicsBody(circleOfRadius: egg.size.width / 2)
            egg.physicsBody?.isDynamic = true
            egg.physicsBody?.affectedByGravity = true
            
            addChild(egg)
        }
    }
    
    private func addBackground() {
        background.size = self.size
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = -1
        addChild(background)
    }
    
    private func addScoreLabel() {
        scoreLabel = SKLabelNode(fontNamed: "Arial")
        scoreLabel.text = "Score: \(score)"
        scoreLabel.fontSize = 36
        scoreLabel.fontColor = SKColor.white
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 50)
        addChild(scoreLabel)
    }
    
    private func gameOver() {
        physicsWorld.speed = 0
        removeAllActions()
        gameDelegate?.didGameOver()
    }
}
