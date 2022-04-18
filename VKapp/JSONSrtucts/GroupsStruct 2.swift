//
//  GroupsStruct.swift
//  VKapp
//
//  Created by Оливер Салихов on 28.03.2022.
//
import RealmSwift
import Foundation






struct GroupsResponse {
    let response: Groups
}

extension GroupsResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct Groups {
    let count: Int
    let items: [Group]
}

extension Groups: Codable {
    enum CodingKeys: String, CodingKey {
        case count
        case items
    }
}



//struct Group {
//    let id: Int
//    let name: String
//    let photo_50: String
//    let photo_200: String
//}

class Group: Object, Codable {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var photo_50 = ""
    @objc dynamic var photo_200 = ""
}

//extension Group: Codable {
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case photo_50
//        case photo_200
//    }
//}
//
extension Group: Comparable {
    static func < (lhs: Group, rhs: Group) -> Bool { lhs.name < rhs.name }
}
