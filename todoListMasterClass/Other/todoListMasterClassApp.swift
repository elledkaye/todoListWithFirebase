//
//  todoListMasterClassApp.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/10/24.
//


// This is the entry point of our app
import FirebaseCore
import SwiftUI

@main
struct todoListMasterClassApp: App {
    init(){
        FirebaseApp.configure()
        
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
