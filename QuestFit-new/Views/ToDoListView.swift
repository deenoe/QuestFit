//
//  ToDoListView.swift
//
//
//  Created by Miguel Bunag on 5/3/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/Reminders"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("Workout Log")
                    .font(.largeTitle)
                    .monospaced()
                    .foregroundStyle(.indigo)
                    .bold()
                    .padding()
                List(items)  {item in
                    ToDoListItemView(item:item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                .toolbar {
                    Button{
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                            .bold()
                            .foregroundColor(.indigo)
                    }
                }
                .sheet(isPresented: $viewModel.showingNewItemView){
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
            }
        }
    }
    


struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View{
        ToDoListView(userId: "Eg0rMr8kxGMuPxpXW010p5iVEvn1")
    }
}
