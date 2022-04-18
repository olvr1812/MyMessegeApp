//
//  UsersStruct.swift
//  VKapp
//
//  Created by Оливер Салихов on 13.03.2022.
//

import Foundation
import RealmSwift

struct FriendsResponse {
    let response: Friends
}

extension FriendsResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct Friends {
    let count: Int
    let items: [User]
}

extension Friends: Codable {
    enum CodingKeys: String, CodingKey {
        case count
        case items
    }
}

//struct User {
//    let id: Int
//    let firstName: String
//    let lastName: String
//    let photo: String
//    let sex: Int
//    var fullName: String { lastName + " " + lastName }
//}

class User: Object, Codable {
    @objc dynamic var id = 0
    @objc dynamic var first_name = ""
    @objc dynamic var last_name = ""
    @objc dynamic var photo_200 = ""
    @objc dynamic var sex = 0
    var fullName: String { first_name + " " + last_name }
}

//extension User: Codable {
//    enum CodingKeys: String, CodingKey {
//        case id
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case photo = "photo_200"
//        case sex
//    }
//}

extension User: Comparable {
    static func < (lhs: User, rhs: User) -> Bool{ lhs.first_name < rhs.last_name }
}


