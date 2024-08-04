//
//  ContentViewModel.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/15/24.
//
import FirebaseAuth
import Foundation

class ContentViewModel: ObservableObject{
    // Whenever the user signs in or signs out this published will be triggered
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        // Listener for our Auth state this should update our main view 
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self]_, user in // weak -> memory manageable too (garbage control) a weak reference to that object
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
        }
        
    }
        
        
        // We want to observe from firebase when the current user changes
        public var isSignedIn: Bool {
            return Auth.auth().currentUser != nil // If there is a value for the current user it means we're signed i
        }
    
    
    
} // What is an observable object?
