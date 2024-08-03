//
//  ProfileViewModel.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/15/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewModel: ObservableObject{ 
    
    init(){}
    
    func toggleIsDone(item: ToDoListItem){
        // Want to validate our UI view
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }// End of guard statement
        
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id )
            .setData(itemCopy.asDictionary())
        
    }
    
}
