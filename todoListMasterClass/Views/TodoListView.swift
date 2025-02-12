//
//  TodoListView.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/10/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel : TodoListViewModel
    // We're going to have a query that will continuously listen for items
    @FirestoreQuery var items: [ToDoListItem]
    

    
    init(userId: String){
        // users/ <id>/todos/<entiries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: TodoListViewModel (userId: userId)
                        
        )// What is a wrapped value?
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    TodoListItemsView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                // Call delete function from TodoListModel
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                                
                            
                        }// End of .swipeActions
                    
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    // Action
                    viewModel.showingNewItemView = true
                }label:{
                    Image(systemName: "plus")
                    
                }// End of label for plus sign
            }
            
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: 
                                $viewModel.showingNewItemView)
                
            }
        }
    }
}

struct TodoListeItemsView_Previews:PreviewProvider{
    static var previews: some View{
        TodoListView(userId: "gLFtQzvHfqVtbIevg7o8n5hJoOb2")
    }
}
