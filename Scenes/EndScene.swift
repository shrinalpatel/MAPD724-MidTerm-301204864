import SpriteKit
import GameplayKit

class EndScene: SKScene
{
    // Istance Variables
    var ocean: Ocean?
    
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        name = "END"
        
        // add ocean to the scene
        if (UIDevice.current.orientation.isPortrait) {
            ocean = Ocean() // allocate memory
            ocean?.position = CGPoint(x: 0, y: 773)
            addChild(ocean!)
        }
        else{
            ocean = Ocean() // allocate memory
            ocean?.zRotation = 67.5
            ocean?.position = CGPoint(x: 733, y: 0)
            addChild(ocean!)
        }
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        ocean?.Update()
        
    }
}
