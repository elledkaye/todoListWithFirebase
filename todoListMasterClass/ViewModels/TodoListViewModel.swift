//
//  TodoListViewModel.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/15/24.
//

import FirebaseFirestore
import Foundation
import SwiftUI

// ViewModel for list of items view
// Primary tab
class TodoListViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    // *TIME STAMP 2:14:55 ON HOW TO CODUMENT
   // function to delete item
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
