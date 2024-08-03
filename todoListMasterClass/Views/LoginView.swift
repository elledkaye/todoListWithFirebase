//
//  LoginView.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/10/24.
//

// We created this login view insde of the navigation view


// View model essentially abstracts all of the business logigcy data that a screen or a view needs to function
import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "To get things done",
                           angle: 15,
                           background: Color.pink)
                
                
                
                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    
                    // Binding $email to email address
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    // Binding $password to password
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Reusable button
                    TLButton(title: "Log In", 
                             background: Color.blue) {
                        // Action
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                // Create Account Link
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
