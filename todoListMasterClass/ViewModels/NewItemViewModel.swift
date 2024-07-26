//
//  NewItemViewModel.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/15/24.
//

import FirebaseAuth
import FirebaseFirestore // AKA our DB
import Foundation

class NewItemViewModel: ObservableObject{
    @Published var dueDate = Date() // default is an instance of a date
    @Published var title = ""
    @Published var showAlert = false
    
    init(){}
    
    
    func save(){
        guard canSave else{
            return
        }
        
        // We want to create a new instance of the todo list (TIME STAMP:1:49:02)
        
        // Get current user ID
        guard let uID = Auth.auth().currentUser?.uid else{
            return
            
        }
        
        // Create model
        // Will convert this model into a dictionary that we can write into the database
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone:false)
        
        
        // Save model to db
        // We want to get an instance of our database
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400)else{
            // By saying due date is greater than today,we subtract 86400 seconds make sure due date is greater than or equal to yesterday
            
            return false
        }
        return true
    }
    
}
