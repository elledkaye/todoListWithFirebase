//
//  RegisterView.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/10/24.
//

import SwiftUI

struct RegisterView: View {
    // Data properties which Swift UI will write the value to as the user types
    //@State var name = ""
    //@State var email = ""
    //@State var password = ""
    
    @StateObject var viewModel = RegisterViewModel()
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            // Header
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: Color.orange)
            // We can repurpose our extracted views to be generic
            
            
            // Registration form
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                // SecureField shows you asteriks
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                TLButton(title: "Create Account",
                         background: Color.green){
                    
                    // Action: Attempt Registration
                    viewModel.register()
                }
                
            }// End of Registration form
            .offset(y: -50)
            
            
            Spacer()
            
        }
        
        
        
    } // End of some View
    
}// End of RegisterView

#Preview {
    RegisterView()
}
