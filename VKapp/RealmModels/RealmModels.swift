//
//  RealmModels.swift
//  VKapp
//
//  Created by Оливер Салихов on 15.04.2022.
//

import Foundation
import RealmSwift
import SwiftyJSON


class Model: Object {
    @objc dynamic var id = 0
}

extension Model {
    convenience init(_ json: JSON) {
        
    }
}
