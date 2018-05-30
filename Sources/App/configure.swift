import FluentSQLite
import Vapor
import Leaf

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    let serverConfig = NIOServerConfig.default(port:9090)
    services.register(serverConfig)
    
    let leafProvider = LeafProvider()
    try services.register(leafProvider)
    
    let sqliteProvider = FluentSQLiteProvider()
    try services.register(sqliteProvider)
    
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)
    
    var databases = DatabasesConfig()
    try databases.add(database: SQLiteDatabase(storage: .memory), as: .sqlite)
    services.register(databases)
    
    var migrations = MigrationConfig()
    migrations.add(model: User.self, database: .sqlite)
    services.register(migrations)
}
