//
//  User.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/4/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import Foundation
class UserModel {
    var email: String?
    var password: String?
    var id: String?
}

extension UserModel {
    static func transformUser(dict: [String: Any], key: String) -> UserModel {
        let user = UserModel()
        user.email = dict["email"] as? String
        user.password = dict["password"] as? String
        user.id = key
        return user
    }
}
