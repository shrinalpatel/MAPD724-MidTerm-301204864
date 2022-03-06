import GameplayKit
import SpriteKit

class Island : GameObject
{
    
    // constructor / initializer
    init()
    {
        if (UIDevice.current.orientation.isPortrait) {
            super.init(imageString: "island", initialScale: 2.0)
        }
        else{
            super.init(imageString: "island", initialScale: 1.0)
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
            if(position.y <= -730)
            {
                Reset()
            }
        }
        else{
            if(position.x <= -730)
            {
                Reset()
            }
        }
    }
    
    override func Reset()
    {
        if (UIDevice.current.orientation.isPortrait) {
            position.y = 730
            // get a pseudo random number -313 to 313
            let randomX:Int = (randomSource?.nextInt(upperBound: 616))! - 313
            position.x = CGFloat(randomX)
        }
        else{
            position.x = 730
            // get a pseudo random number -313 to 313
            let randomY:Int = (randomSource?.nextInt(upperBound: 616))! - 313
            position.y = CGFloat(randomY)
        }
        isCollding = false
    }
    
    // initialization
    override func Start()
    {
        Reset()
        zPosition = 1
        verticalSpeed = 5.0
        horizontalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        if (UIDevice.current.orientation.isPortrait) {
            position.y -= verticalSpeed!
        }
        else{
            position.x -= horizontalSpeed!
        }
    }
}
