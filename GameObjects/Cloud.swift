import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    
    // constructor / initializer
    init()
    {
        if (UIDevice.current.orientation.isPortrait) {
            super.init(imageString: "cloud", initialScale: 1.0)
        }
        else{
            super.init(imageString: "cloud", initialScale: 0.6)
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
            if(position.y <= -756)
            {
                Reset()
            }
        }
        else{
            if(position.x <= -756)
            {
                Reset()
            }
        }
    }
    
    override func Reset()
    {
        if (UIDevice.current.orientation.isPortrait) {
            // randomize vertical speed
            verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
            
            // randomize horizontal drift
            horizontalSpeed = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
            
            
            // get a pseudo random number -262 to 262
            let randomX:Int = (randomSource?.nextInt(upperBound: 524))! - 262
            position.x = CGFloat(randomX)
            
            // get a pseudo random number 756 to 776
            let randomY:Int = (randomSource?.nextInt(upperBound: 20))! + 756
            position.y = CGFloat(randomY)
        }
        else{
            // randomize horizontal speed
            horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
            
            // randomize vertical drift
            verticalSpeed = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
            
            
            // get a pseudo random number -262 to 262
            let randomY:Int = (randomSource?.nextInt(upperBound: 524))! - 262
            position.y = CGFloat(randomY)
            
            // get a pseudo random number 756 to 776
            let randomX:Int = (randomSource?.nextInt(upperBound: 20))! + 756
            position.x = CGFloat(randomX)
        }
        
        isCollding = false
    }
    
    // initialization
    override func Start()
    {
        Reset()
        zPosition = 3
        alpha = 0.5 // 50% transparent
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
}
