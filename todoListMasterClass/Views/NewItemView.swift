//
//  NewItemView.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/10/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
               
            
            Form{
                
                // Title
                TextField("Title", text: $viewModel.title)
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButton(title: "Save",
                         background: Color.pink){
                   
                    
                    if viewModel.canSave{
                        // Action
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                        
                    }
                    
                    
                
                } // End of button styling
                         .padding()
            }// End of Form
            
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"), message: Text( "Please fill in all fields and select due date that is today or newer")
                )
            }
            
        }// End of VStack
    }
}

#Preview {
    NewItemView(newItemPresented:Binding(get: {
        return true
    }, set: {_ in
        
        
    }))
}
