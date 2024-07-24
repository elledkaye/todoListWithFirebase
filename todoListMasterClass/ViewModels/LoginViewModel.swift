//
//  LoginViewModel.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/15/24.
//


import FirebaseAuth // Gives us functionality with the provided email address
import Foundation


class LoginViewModel: ObservableObject{
    // When it changes a view will recommpute, plublished is no exception?
    // what is the @Published wrapper?
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = "" 
    
    init(){}
        
        func login(){
            guard validate() else{
                return
                
            }
         
            // Try to log in
            Auth.auth().signIn(withEmail: email, password: password) // Reference to firebase authentication
            
        }
        
       private func validate() -> Bool {
           errorMessage = ""
           guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                 !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
               
               errorMessage = " Please fill in all fields"
               
               
               return false
               
           }
           
           // Email validation
           guard email.contains("@") && email.contains(".")else{
               errorMessage = " Please enter valid email."
               return false
               
           }
           
           return true
            
        }
    
}
