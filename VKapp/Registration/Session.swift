//
//  Session.swift
//  VKapp
//
//  Created by Оливер Салихов on 22.02.2022.
//

import Foundation

class Session {
    
    static let session = Session()
    
    private init() {}
    
    var token: String = ""
    var userId: Int = 0
}
