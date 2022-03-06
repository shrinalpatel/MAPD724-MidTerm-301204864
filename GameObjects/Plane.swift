import GameplayKit
import SpriteKit

class Plane : GameObject
{
    // initializer
    init()
    {
        if (UIDevice.current.orientation.isPortrait) {
            super.init(imageString: "plane", initialScale: 2.0)
        }
        else{
            super.init(imageString: "plane", initialScale: 1.0)
        }
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func CheckBounds()
    {
        if (UIDevice.current.orientation.isPortrait) {
            // constraint on the left boundary
            if(position.x <= -310)
            {
                position.x = -310
            }
            
            // constraint on the right boundary
            if(position.x >= 310)
            {
                position.x = 310
            }
        }
        else{
            // constraint on the top boundary
            if(position.y >= 310)
            {
                position.y = 310
            }
            
            // constraint on the botttom boundary
            if(position.y <= -310)
            {
                position.y = -310
            }
        }
    }
    
    // initialization
    override func Start()
    {
        zPosition = 2
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
}
