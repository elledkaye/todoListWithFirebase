//
//  ContentView.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/10/24.
//


// How can I change the title of this folder to MainView??
// Time stamp: 13:53
import SwiftUI

// Login View is
struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            // if signed in
            accountView
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{   // Will show a tab bar for each of the views inside of it
            TodoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home",
                          systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile",
                          systemImage:"person.circle")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
