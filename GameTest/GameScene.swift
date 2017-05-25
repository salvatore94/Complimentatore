//
//  GameScene.swift
//  GameTest
//
//  Created by Salvatore  Polito on 26/11/16.
//  Copyright © 2016 Salvatore  Polito. All rights reserved.
//

import SpriteKit
import GameplayKit

import Lottie

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var listaComplimenti = ["sei bellissima ♥︎", "sei cucciolosa ♥︎", "sei dolcissima ♥︎", "sei meravigliosa ♥︎", "hai le mani coccolosissime", "le guanciotte sono morbidissime", "sei il mio cuoricino ♥︎", "hai occhi dolcissimi"]

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let index = GKRandomDistribution(lowestValue: 0, highestValue: (listaComplimenti.count - 1))
        let num = index.nextInt()
        
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.text = listaComplimenti[num]
            
            if num > 3 {
                label.fontSize = 55
            } else {
                label.fontSize = 80
            }

            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches {
            //let point = t.location(in: self)
            
            let animation = LOTAnimationView(name: "quick_hart_select")
            animation?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            animation?.center = t.preciseLocation(in: self.view)
            self.view?.addSubview(animation!)
            
            animation?.play()
            self.view?.subviews[0].removeFromSuperview()
        }
    }
    

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

extension SKSpriteNode {
    
    func addGlow(radius: Float = 15) {
        let effectNode = SKEffectNode()
        effectNode.shouldRasterize = true
        addChild(effectNode)
        effectNode.addChild(SKSpriteNode(texture: texture))
        effectNode.filter = CIFilter(name: "CIGaussianBlur", withInputParameters: ["inputRadius":radius])
    }
}
