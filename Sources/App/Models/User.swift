import Vapor
import FluentMySQL

final class User: MySQLModel {
    var id: Int?
    var name: String
    
    init(id: Int? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

extension User: Content {}

extension User: Migration {}

extension User: Parameter {}
