
import SpriteKit

class GameScene: SKScene {
    
    //DANIEL
    
    //intancia de botoes
    
    // instancia de GameViewController - geralmente é 1 só
    var gameController: GameViewController!
    var gameSceneInicial: GameSceneInicial!
    
    // Declaração do background da scene
    var ceu: SKSpriteNode!
    var fundo: SKSpriteNode!
    
    // instancia do personagem
    var personagem: SKSpriteNode!
    
    // instancia da ponte
    
    //instancia de objetos
    var machado: OpcoesObjetos!
    var bamboo: OpcoesObjetos!
    var cenoura: OpcoesObjetos!
    var corda: OpcoesObjetos!
    var arvore: SKSpriteNode!
    var nuvem1: SKSpriteNode!
    var nuvem2: SKSpriteNode!
    //var pulo: SKSpriteNode!
    
    // instancia variavel de controle de toque
    var toqueObjetoOpcao = false
    var validarArvore = false
    
    //instancias para a arvore cair
//    var ArvoreCaindo = SKSpriteNode()
//    var TextureArray = [SKTexture]()
//    var TextureArvore = SKTextureAtlas()
    
    /* Método que é chamado somente uma vez - quando o jogo é aberto */
    override func didMoveToView(view: SKView) {
        // chama método de criar a scene
        montaScene()
        personagemEntrando()
    }
    
        /* Método que é chamado toda vez que toca na tela */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // pega primeiro toque
        let touch = touches.first
        // pega localizaçao do toque
        let touchLocation = touch!.locationInNode(self)
        // armazena como node
        let toque = self.nodeAtPoint(touchLocation)
        
        

        if toque.name == "machado" && personagem.position.x == 900{
            toqueObjetoOpcao = true
        }
        
//        if toque.name == "arvore" && toqueObjetoOpcao == true{
//            toqueObjetoOpcao = false
//            TextureArvore = SKTextureAtlas(named:"CrossTheRiver")
//            for i in 1...TextureArvore.textureNames.count{
//                let Name = "arvore0\(i).png"
//                TextureArray.append(SKTexture(imageNamed: Name))
//            }
//            
//            ArvoreCaindo = SKSpriteNode(imageNamed: TextureArvore.textureNames[0])
//            
//            ArvoreCaindo.name = "arvoreCaindo"
//            ArvoreCaindo.size = CGSize(width: 900, height: 900)
//            ArvoreCaindo.position = CGPoint(x: 450, y: 350)
//            ArvoreCaindo.zPosition = 5
//            addChild(ArvoreCaindo)
//            ArvoreCaindo.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(TextureArray,timePerFrame:0.15)))
//            
//            // animação arvore caindo
//            //let trocaArvore = SKAction.runBlock({ () -> Void in
//            //    self.arvore.texture = SKTexture(imageNamed: "arvore09")
//            //    self.arvore.position = CGPoint(x: 500, y: 300)
//            //    self.arvore.size = CGSize(width: 1000, height: 500)
//            //})
//            
//            //arvore.runAction(trocaArvore, completion: { () -> Void in
//            //    self.validarArvore = true
//            //})
//            
//            
//        }

        //if validarArvore == true && toque.name == "pulo"{
          //  personagemPulandoNaArvore()
        //}
        
        //if validarArvore == false && toque.name == "pulo"{
        //    personagemPulando()
        //}
    }
    
    /* Método responsável por criar a scene */
    func montaScene(){
        
        let nuvens = Nuvens(frame: self.frame)
        for node in nuvens.getNode() {
            addChild(node)
        }
        
        let nuvens2 = Nuvens2(frame: self.frame)
        for node in nuvens2.getNode() {
            addChild(node)
        }
        
        // instancia o SKSPriteNode dizendo que imagem ele irá usar
        ceu = SKSpriteNode(imageNamed: "ceu")
        fundo = SKSpriteNode(imageNamed: "fundo")
        nuvem1 = SKSpriteNode(imageNamed: "nuvem01")
        nuvem2 = SKSpriteNode(imageNamed: "nuvem02")
        machado = OpcoesObjetos(texture: SKTexture(imageNamed: "machado"), color: UIColor.clearColor(), size: CGSize(width: 90, height: 90))
        cenoura = OpcoesObjetos(texture: SKTexture(imageNamed: "cenoura"), color: UIColor.clearColor(), size: CGSize(width: 90, height: 90))
        bamboo = OpcoesObjetos(texture: SKTexture(imageNamed: "bamboo"), color: UIColor.clearColor(), size: CGSize(width: 90, height: 90))
        corda = OpcoesObjetos(texture: SKTexture(imageNamed: "corda"), color: UIColor.clearColor(), size: CGSize(width: 90, height: 90))
        
        arvore = SKSpriteNode(imageNamed:"arvore01")
        //pulo = SKSpriteNode(imageNamed:"num2")
//        TextureArvore = SKTextureAtlas(named :"Teste2")
        
        // seta a posiçao em z desse node, lembrando que em SpriteKit os nodes na scene sempre estão em camadas
        ceu.zPosition = 1
        nuvem1.zPosition = 1
        nuvem2.zPosition = 1
        fundo.zPosition = 2
        machado.zPosition = 3
        corda.zPosition = 3
        bamboo.zPosition = 3
        cenoura.zPosition = 3
        arvore.zPosition = 2
        //pulo.zPosition = 4
        
        
        // setar nome das variáveis
        ceu.name = "ceu"
        nuvem1.name = "nuvem1"
        nuvem2.name = "nuvem2"
        fundo.name = "fundo"
        machado.name = "machado"
        machado.posicaoInicial = CGPoint(x: 400, y: 70)
        bamboo.name="bamboo"
        bamboo.posicaoInicial  = CGPoint(x: 550, y: 70)
        cenoura.name="cenoura"
        cenoura.posicaoInicial = CGPoint(x: 700, y: 70)
        corda.name="corda"
        corda.posicaoInicial = CGPoint(x:850, y:730)
        arvore.name = "arvore"
        //pulo.name = "pulo"
        
        // seta o tamanho que esse node terá
        ceu.size = CGSize(width: 1050, height: 800)
        nuvem1.size = CGSize(width: 400, height: 100)
        nuvem2.size = CGSize(width: 400, height: 100)
        fundo.size = CGSize(width: 1050, height: 800)
        arvore.size = CGSize(width: 100, height: 550)
        //pulo.size = CGSize(width: 50, height: 50)
        
        // seta a posição que esse node estará na scene
        ceu.position = CGPoint(x: 510, y: 400)
        nuvem1.position = CGPoint(x: 400, y: 700)
        nuvem2.position = CGPoint(x: 700, y: 600)
        fundo.position = CGPoint(x: 510, y: 400)
        machado.position = machado.posicaoInicial
        cenoura.position = cenoura.posicaoInicial
        bamboo.position = bamboo.posicaoInicial
        corda.position = corda.posicaoInicial
        arvore.position = CGPoint(x: 850, y: 500)
        //pulo.position = CGPoint(x: 300, y: 730)
        
        // adiciona o node na scene
        addChild(ceu)
//        addChild(nuvem1)
//        addChild(nuvem2)
        addChild(fundo)
        addChild(machado)
        addChild(cenoura)
        addChild(bamboo)
        addChild(arvore)
        //addChild(pulo)
        
        personagem = SKSpriteNode(imageNamed: "personagemChegada05")
        personagem.zPosition = 3
        personagem.name = "personagemEntrando"
        personagem.size = CGSize(width: 100, height: 100)
        personagem.position = CGPoint(x: 1100, y: 300)
        
        addChild(personagem)
        
        
        
        
    }
    
    func personagemEntrando(){
        
        let esperar = SKAction.waitForDuration(2)
        let andar = SKAction.moveToX(900, duration: 1)
        
        let sequence = SKAction.sequence([esperar, andar])
        personagem.runAction(sequence)
        
        
        
    }
    
    
    func personagemPulandoNaArvore(){
        let pular = SKAction.moveToY(370, duration: 0.05)
        let andar = SKAction.moveToX(200, duration: 2)
        let sequence = SKAction.sequence([pular, andar])
        personagem.runAction(sequence) { () -> Void in
            self.fimNivel()
        }
        
        }
    
    //func personagemPulando(){
      //  let subindo = SKAction.moveToY(340, duration: 0.5)
        //let descendo = SKAction.moveToY(300, duration: 0.5)
        //let sequence = SKAction.sequence([subindo, descendo])
        //personagem.runAction(sequence)
    //}
    
    func intersectaNode(opcao: OpcoesObjetos, posicaoInicial: CGPoint){
        if opcao.intersectsNode(arvore) {
            let trocaArvore1 = SKAction.runBlock({ () -> Void in
                self.arvore.texture = SKTexture(imageNamed: "arvore02")
                self.arvore.size = CGSize(width: 100, height: 550)
            })
            
            let trocaArvore2 = SKAction.runBlock({ () -> Void in
                self.arvore.texture = SKTexture(imageNamed: "arvore03")
                self.arvore.size = CGSize(width: 100, height: 550)
            })
            
            let trocaArvore3 = SKAction.runBlock({ () -> Void in
                self.arvore.texture = SKTexture(imageNamed: "arvore04")
                self.arvore.size = CGSize(width: 150, height: 550)
                self.arvore.position = CGPoint(x: 820, y: 500)
            })
            
            let trocaArvore4 = SKAction.runBlock({ () -> Void in
                self.arvore.texture = SKTexture(imageNamed: "arvore05")
                self.arvore.size = CGSize(width: 300, height: 550)
                self.arvore.position = CGPoint(x: 820, y: 500)
            })
            
            let trocaArvore5 = SKAction.runBlock({ () -> Void in
                self.arvore.texture = SKTexture(imageNamed: "arvore06")
                self.arvore.size = CGSize(width: 600, height: 550)
                self.arvore.position = CGPoint(x: 630, y: 450)
            })
            
            let trocaArvore6 = SKAction.runBlock({ () -> Void in
                self.arvore.texture = SKTexture(imageNamed: "arvore07")
                self.arvore.size = CGSize(width: 900, height: 550)
                self.arvore.position = CGPoint(x: 450, y: 450)
            })
            
            let trocaArvore7 = SKAction.runBlock({ () -> Void in
                self.arvore.texture = SKTexture(imageNamed: "arvore08")
                self.arvore.size = CGSize(width: 900, height: 550)
                self.arvore.position = CGPoint(x: 450, y: 450)
            })
            
            let trocaArvore8 = SKAction.runBlock({ () -> Void in
                self.arvore.texture = SKTexture(imageNamed: "arvore09")
                self.arvore.size = CGSize(width: 900, height: 550)
                self.arvore.position = CGPoint(x: 450, y: 450)
                self.arvore.zPosition = 5
            })
            
            let sequencia: SKAction = SKAction.sequence([trocaArvore1, trocaArvore2, trocaArvore3, trocaArvore4, trocaArvore5, trocaArvore6, trocaArvore7, trocaArvore8 ])
            
            arvore.runAction(sequencia, completion: { () -> Void in
                self.personagemPulandoNaArvore()
                self.machado.position = self.machado.posicaoInicial
            })
        }

    }
    func fimNivel(){
        ceu.removeFromParent()
        machado.removeFromParent()
        bamboo.removeFromParent()
        cenoura.removeFromParent()
        arvore.removeFromParent()
        personagem.removeFromParent()
        
        fundo.texture = SKTexture(imageNamed: "CrossTheRiver_lvl_complete")
    }
    }



