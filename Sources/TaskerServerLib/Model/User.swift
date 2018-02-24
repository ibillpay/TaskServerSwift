//
//  User.swift
//  TaskerServer
//
//  Created by Marcin Czachurski on 12.02.2018.
//

import Foundation

public class User : EntityProtocol {
    
    public var id: Int
    public var name: String
    public var email: String
    public var isLocked: Bool
    
    init(id: Int, name: String, email: String, isLocked: Bool) {
        self.id = id
        self.name = name
        self.email = email
        self.isLocked = isLocked
    }
}
