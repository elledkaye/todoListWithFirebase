//
//  ProfileView.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/10/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
            
                // Info: Name, Email, Member  since
                VStack{
                    // ProfileName Stack
                    if let user = viewModel.user{
                        profile(user: user)
                            
                    } else{
                        Text("Loading Profile...")
                    }
                        
                }
                    
                  
            } // End of Vstack
            .navigationTitle("Profile") // what are modifiers?
        }
        
        .onAppear{
            viewModel.fetchUser()
            
        }
    }
    
    
    @ViewBuilder
    func profile(user: User) -> some View{
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        HStack{
            Text("Name: ")
                .bold()
            Text(user.name)
        }
        .padding()
        // ProfileEmail Stack
        HStack{
            Text("Email: ")
                .bold()
            Text(user.email)
        }
        .padding()
        
        HStack{
            Text("Member Since:")
                .bold()
            Text("\(Date(timeIntervalSince1970:user.joined).formatted(date:.abbreviated, time: .shortened))")
        }
        .padding()
        
        
        // SIgn Out
        Button("Log Out"){
            viewModel.logOut()
            
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
