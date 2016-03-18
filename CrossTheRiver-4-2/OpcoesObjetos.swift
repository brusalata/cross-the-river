
import SpriteKit

class OpcoesObjetos: SKSpriteNode {
    var posicaoInicial: CGPoint!
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.userInteractionEnabled = true
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let location = touch!.locationInNode(self.parent!)
        
        posicaoInicial = location
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let location = touch!.locationInNode(self.parent!)
        
        self.position = location
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let location = touch!.locationInNode(self.parent!)
        
        
        let toque = nodeAtPoint(location)
        
        let toc = toque as! OpcoesObjetos
        
        if toc.name == "machado" {
            (toque.parent as! GameScene).intersectaNode(toc, posicaoInicial: posicaoInicial)
        }
        
        self.position = self.posicaoInicial
    }
}
