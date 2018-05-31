import Vapor
import Leaf

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    let userController = UserController()
    router.get("users", use: userController.list)
    router.post("users", use: userController.create)
    
}

struct Person: Content {
    var name: String
    var age: Int
}
