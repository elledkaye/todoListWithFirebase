//
//  User.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/15/24.
//

import Foundation

// Made this codeable is were going to be able to convert anything that's codeable into a dictionary for us with strings
struct User: Codable{
    
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    
}
