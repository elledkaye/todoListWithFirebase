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
                
            } // End of Vstack
            .navigationTitle("Profile") // what are modifiers?
        }
    }
}

#Preview {
    ProfileView()
}
