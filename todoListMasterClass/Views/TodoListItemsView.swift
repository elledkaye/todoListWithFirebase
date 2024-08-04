//
//  TodoListItemsView.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/15/24.
//

import SwiftUI

struct TodoListItemsView: View {
    @StateObject var viewModel = TodoListItemsViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
                
            } // End of Vertical Stack
            
            Spacer()
            
            Button{
                
                viewModel.toggleIsDone(item: item)
                
                
            }label:{
                // Imaahe name if the item is done we are going to show a filled in circle otherwise we are going to show an unfilled ciircle
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
            
        } // End of Horizontal Stack
    }
}

#Preview {
    TodoListItemsView(item: .init(id: "123", title: "Get milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
