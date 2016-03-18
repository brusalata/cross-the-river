
import SpriteKit

class GameSceneInicial: SKScene {
    
    var gameController: GameViewController!
    
    // ponte
    var ponte: SKSpriteNode!
    
    // Declaração do background da scene
    var background: SKSpriteNode!
    
    // Declaracao do personagem
    var personagem: SKSpriteNode!
    
    // variavel que valida se a animação ja acabou
    var validaAnimacao = false
    
    //Declaracao do ceu
    var ceu:SKSpriteNode!
    
    //Declaracao do fundo
    var fundo:SKSpriteNode!
    
    //Declaracao das nuvens
    //var nuvem1: SKSpriteNode!
    //var nuvem2: SKSpriteNode!
    
    //Declaracao da imagem de transparencia
    var imagemTransparente: SKSpriteNode!
    
    //Declaracao do subtitulo
    var subtitulo:SKSpriteNode!
    
    //Declaracao do logo
    var titulo1:SKSpriteNode!
    
    /* Método que é chamado somente uma vez - quando o jogo é aberto */
    override func didMoveToView(view: SKView) {
        // chama método de criar a scene
        montaScene()
        personagemEntrando()
        
    }
    
    /* Método que é chamado toda vez que toca na tela */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
//        // pega primeiro toque
//        let touch = touches.first
//        // pega localizaçao do toque
//        let touchLocation = touch!.locationInNode(self)
//        // armazena como node
//        let toque = self.nodeAtPoint(touchLocation)
        
        if validaAnimacao == true {
            // intancia a proxima scene
            let gameScene = GameScene(size: size)
            // chama o método que faz a proxima scene aparecer
            self.scene?.view?.presentScene(gameScene)
        }
        
        
    }
    
    /* Método responsável por criar a scene */
    func montaScene(){
        
        
        
        ceu = SKSpriteNode(imageNamed: "ceu")
        ceu.zPosition = 1
        ceu.name = "ceu"
        ceu.size = CGSize(width: 1050, height: 800)
        ceu.position = CGPoint(x: 510, y: 400)
        
        //nuvem1 = SKSpriteNode(imageNamed: "nuvem01")
        //nuvem1.zPosition = 2
        //nuvem1.name = "nuvem1"
        //nuvem1.size = CGSize(width: 400, height: 100)
        //nuvem1.position = CGPoint(x: 400, y: 700)
        
        //nuvem2 = SKSpriteNode(imageNamed: "nuvem02")
        //nuvem2.zPosition = 2
        //nuvem2.name = "nuvem2"
        //nuvem2.size = CGSize(width: 400, height: 100)
        //nuvem2.position = CGPoint(x: 700, y: 600)
        
        
        fundo = SKSpriteNode(imageNamed: "CrossTheRiver_sembarra")
        fundo.zPosition = 3
        fundo.name = "fundo"
        fundo.size = CGSize(width: 1050, height: 800)
        fundo.position = CGPoint(x: 510, y: 400)
        
        
        
        subtitulo = SKSpriteNode(imageNamed: "touchToStart")
        subtitulo.zPosition = 5
        subtitulo.name = "subtitulo"
        subtitulo.size = CGSize(width: 1, height: 1)
        subtitulo.position = CGPoint(x: 500, y: 100)
        
        titulo1 = SKSpriteNode(imageNamed: "crossTheRiverLogo")
        titulo1.zPosition = 5
        titulo1.name = "titulo1"
        titulo1.size = CGSize(width: 1, height: 1)
        titulo1.position = CGPoint(x: 500, y: 600)
        
        ponte = SKSpriteNode(imageNamed: "ponte01")
        ponte.zPosition = 5
        ponte.name = "ponteInteira"
        ponte.size = CGSize(width: 690, height: 180)
        ponte.position = CGPoint(x: 500, y: 300)
        
        personagem = SKSpriteNode(imageNamed: "personagemChegada05")
        personagem.zPosition = 5
        personagem.name = "personagem"
        personagem.size = CGSize(width: 100, height: 100)
        personagem.position = CGPoint(x: 1100, y: 300)
        
        addChild(ceu)
        //addChild(nuvem1)
        //addChild(nuvem2)
        addChild(fundo)
        addChild(subtitulo)
        addChild(titulo1)
        addChild(ponte)
        addChild(personagem)
    }
    
    func personagemEntrando(){
        
        let esperar = SKAction.waitForDuration(2)
        let andar = SKAction.moveToX(840, duration: 1)
        let pular = SKAction.moveToY(340, duration: 0.05)
        let andar1 = SKAction.moveToX(780, duration: 1)
        
        let sequence = SKAction.sequence([esperar, andar, pular, andar1])
        personagem.runAction(sequence) { () -> Void in
            self.ponteQuebrando()
        }
        
    }
    
    func ponteQuebrando(){
        let ponteQuebrada = SKAction.runBlock({ () -> Void in
            self.ponte.texture = SKTexture(imageNamed: "ponte09")
            self.ponte.position = CGPoint(x: 520, y: 280)
            self.ponte.size = CGSize(width: 680, height: 180)
        })
        ponte.runAction(ponteQuebrada) { () -> Void in
            self.aparecendoNome()
            
            self.imagemTransparente = SKSpriteNode(imageNamed: "transparenciaInicio")
            self.imagemTransparente.zPosition = 4
            self.imagemTransparente.name = "imagemTransparente"
            self.imagemTransparente.size = CGSize(width: 1050, height: 800)
            self.imagemTransparente.position = CGPoint(x: 510, y: 400)
            
            self.addChild(self.imagemTransparente)
        }
    }
    
    func aparecendoNome(){
        let surgirTitulo1 = SKAction.scaleXBy(850, y: 300, duration: 1)
        
        titulo1.runAction(surgirTitulo1) { () -> Void in
            self.aparecendoNome2()
        }
        

    }
    
    func aparecendoNome2(){
        let surgirSubtitulo = SKAction.scaleXBy(300, y: 50, duration: 1)
        
        subtitulo.runAction(surgirSubtitulo) { () -> Void in
            self.validaAnimacao = true
}
}
}

