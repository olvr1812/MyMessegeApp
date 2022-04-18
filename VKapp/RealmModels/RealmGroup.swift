//
//  RealmGroupe.swift
//  VKapp
//
//  Created by Оливер Салихов on 14.04.2022.
//

import Foundation
import RealmSwift
import SwiftyJSON

class RealmGroup: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var photo_50 = ""
    @objc dynamic var photo_200 = ""
}

extension RealmGroup {
    convenience init(_ json: JSON) {
        self.init()
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.photo_50 = json["photo_50"].stringValue
        self.photo_200 = json["photo_200"].stringValue
    }
}
