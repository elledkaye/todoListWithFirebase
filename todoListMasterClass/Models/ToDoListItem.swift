//
//  ToDoListItem.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/15/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{ // What is a struct?
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state:Bool){
        isDone = state
        
    }
    
}
