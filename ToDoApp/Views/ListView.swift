//
//  ListItemViews.swift
//  ToDoApp
//
//  Created by Berkay Emre Aslan on 4.07.2024.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

struct ListView: View {
    
    @StateObject var viewModel: ListViewVM
    @FirestoreQuery var items: [ListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(
        collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ListViewVM(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) {item in
                    ListItemView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ListView(userId: "8iTnuDYUafTxwFmijYTBQPvFq8q2")
}
