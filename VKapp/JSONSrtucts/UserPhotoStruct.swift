//
//  UserPhotoStruct.swift
//  VKapp
//
//  Created by Оливер Салихов on 31.03.2022.
//

import Foundation
import RealmSwift


struct PhotoResponse {
    let response: Photos
}

extension PhotoResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct Photos {
    let count: Int
    let items: [Photo]
}

extension Photos: Codable {
    enum CodingKeys: String, CodingKey {
        case count
        case items
    }
}



//struct Photo {
//    var id: Int
//    var owner_id: Int
//    var post_id: Int
//    var sizes: [Sizes]
//    var likes: Likes
//}

class Photo: Object, Codable {
    @objc dynamic var id = 0
    @objc dynamic var owner_id = 0
    @objc dynamic var post_id = 0
    var sizes = List<Sizes>()
    @objc dynamic var likes: Likes?
    
//    override static func primaryKey() -> String? {
//        return "owner_id"
//    }
}

class Sizes: Object, Codable {
    @objc dynamic var height = 0
    @objc dynamic var url =  ""
    @objc dynamic var type = ""
    @objc dynamic var width = 0
}
    
class Likes: Object, Codable {
    @objc dynamic var count = 0
    @objc dynamic var user_likes = 0
    
}
