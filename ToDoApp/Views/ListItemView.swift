//
//  ListItemView.swift
//  ToDoApp
//
//  Created by Berkay Emre Aslan on 4.07.2024.
//

import SwiftUI

struct ListItemView: View {
    @StateObject var viewModel = ListItemViewVM()
    let item: ListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button(action: {
                viewModel.toggleIsDone(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            })
        }
    }
}

#Preview {
    ListItemView(item: .init(id: "123",
                             title: "Get milk",
                             dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
