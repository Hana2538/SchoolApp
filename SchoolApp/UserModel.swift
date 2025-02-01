import Foundation
import SwiftUI

class User{
    var name:String
    var password: String
    var email: String

    init(name: String, password: String, email: String) {
        self.name = name
        self.password = password
        self.email = email
    }
}


