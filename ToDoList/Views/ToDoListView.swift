//
//  ToDoListView.swift
//  ToDoList
//
//  Created by TheForce on 9/29/24.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Query var toDos: [ToDo]
    
    @State private var sheetIsPresented = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos) { toDo in
                    HStack {
                        Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                toDo.isCompleted.toggle()
                                guard let _ = try? modelContext.save() else {
                                    print("😡 ERROR: Save after .toggle on ToDoListView did not work")
                                    return
                                }
                            }
                        
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(toDo)
                                guard let _ = try? modelContext.save() else {
                                    print("😡 ERROR: Save on DetailView did not work")
                                    return
                                }
                            }
                        }
                    }
                    .font(.title2)
                }
            }
            .navigationBarTitle("Dragon List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: ToDo())
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ToDoListView()
        .modelContainer(for: ToDo.self, inMemory: true)
}
