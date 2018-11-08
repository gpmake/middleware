import FluentSQLite
import Vapor
import Authentication

final class User: SQLiteModel {
    var id: Int?
    var email: String
    var password: String
    var isAdmin: Bool?

    init(
        id: Int? = nil,
        email: String,
        password: String,
        isAdmin: Bool? = false
    ) {
        self.id = id
        self.email = email
        self.password = password
        self.isAdmin = isAdmin
    }
}

extension User: Content {}
extension User: Migration {}

extension User: PasswordAuthenticatable {
    static var usernameKey: WritableKeyPath<User, String> {
        return \User.email
    }
    static var passwordKey: WritableKeyPath<User, String> {
        return \User.password
    }
}

extension User: SessionAuthenticatable {}

extension User {
    struct AdminRegister: Content {
        var email: String
        var password: String
        var isAdmin: String
    }
}
