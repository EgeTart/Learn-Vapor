import Vapor
import FluentSQLite

final class User: SQLiteModel {
    var id: Int?
    var name: String
    
    init(id: Int? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

extension User: Content {}

extension User: Migration {}
