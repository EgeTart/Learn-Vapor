import Vapor
import Leaf

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get("name") { req in
        return "Passaction"
    }
    
    router.get("age") { req in
        return 23
    }
    
    router.get("json") { req in
        return Person(name: "Passaction", age: 23)
    }
    
    router.get("view") { req -> Future<View> in
        return try req.view().render("welcome")
    }
    
    router.get("bonus") { (req) -> Future<View> in
        let passaction = Person(name: "Passaction", age: 23)
        return try req.view().render("whoami", passaction)
    }
}

struct Person: Content {
    var name: String
    var age: Int
}
