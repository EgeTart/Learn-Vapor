import FluentMySQL
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    let serverConfig = NIOServerConfig.default(port:9090)
    services.register(serverConfig)
    
    let databseProvider = FluentMySQLProvider()
    try services.register(databseProvider)
    
    let mysqlConfig = MySQLDatabaseConfig(
        hostname: "127.0.0.1",
        port: 3306,
        username: "swift",
        password: "passaction1234",
        database: "swift_test")
    services.register(mysqlConfig)
    
    var migrations = MigrationConfig()
    migrations.add(model: User.self, database: .mysql)
    services.register(migrations)
}
