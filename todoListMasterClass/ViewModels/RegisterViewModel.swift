//
//  RegisterViewModel.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/15/24.
//

import FirebaseFirestore
import Foundation
import FirebaseAuth

// What is an observable object?
class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init(){}
    
    func register(){
        guard validate() else{
            return
            
        }
        
        
        Auth.auth().createUser(withEmail:email, password:password){[weak self] result, error in // what is a weak self?
            guard let userId = result?.user.uid else{
                return
                
            } // uid = newly created users unique identifier
            
            self?.insertUserRecord(id: userId)
            
        }
        
    }// End of register()
    
    
    // New user object
    private func insertUserRecord(id: String){
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
        
    }
    
    private func validate() -> Bool{
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            
            return false
        }
        
        // Password must be greater than or equal to 6 characters
        guard password.count >= 8 else{
            
            return false
            
        }
        
        return true
    } // End of validate()
    
}// End of Class
