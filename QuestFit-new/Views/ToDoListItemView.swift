//
//  ToDoListItemsView.swift
//  RaccoonRemind
//
//  Created by Miguel Bunag on 5/3/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemsViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text(item.title)
                    .font(.body)
                    .monospaced()
                    .foregroundStyle(.white)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date:.abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color.white)
                    .monospaced()
            }
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .bold()
                    .foregroundStyle(.white)
            }
        }
        .padding()
        .cornerRadius(9)
        .background(.indigo)
    }
}

struct ToDoListItemView_Previews: PreviewProvider{
    static var previews: some View {
        ToDoListItemView(item: .init(
            id: "123",
            title: "Get Milk",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone:false
        ))
    }
}
