import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    
    // constructor / initializer
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func CheckBounds()
    {
        if(position.y <= -756)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
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
