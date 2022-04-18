//
//  Realm.swift
//  VKapp
//
//  Created by Оливер Салихов on 11.04.2022.
//

import Foundation
import RealmSwift

class MyGroups: Object, Decodable {
    @objc dynamic var name = ""
    @objc dynamic var photo = ""

}

