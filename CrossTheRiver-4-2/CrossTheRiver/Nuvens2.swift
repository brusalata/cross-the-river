//
//  Nuvens2.swift
//  CrossTheRiver
//
//  Created by Student on 11/25/15.
//  Copyright © 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

class Nuvens2 {
    
    private var node: Array<SKSpriteNode> = [SKSpriteNode]()
    
    init(frame: CGRect){
        
        let texture: SKTexture = SKTexture(imageNamed: "nuvem01")
        //let movebg: SKAction = SKAction.moveByX(-texture.size().width, y: 0, duration: 6)
        let limite: SKAction = SKAction.moveToX(1024, duration: 100)
        //let replacebg: SKAction = SKAction.moveByX(texture.size().width, y: 0, duration: 0)
        let action = SKAction.repeatActionForever(SKAction.sequence([limite]))
        
        //let width: CGFloat = texture.size().width
        for var i: Int = 0; i < 1; i++ {
            
            node.append(SKSpriteNode(texture: texture))
            
            node[i].runAction(action)
            node[i].position = CGPoint(x: 300, y: 600)
            node[i].zPosition = 2
            node[i].size.height = 50
            node[i].size.width = 300
            
        }
        
    }
    
    func getNode() -> Array<SKSpriteNode> {
        return self.node
    }
    
    
}