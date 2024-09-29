//
//  ToDoListView.swift
//  ToDoList
//
//  Created by TheForce on 9/29/24.
//

import SwiftUI

struct ToDoListView: View {
    var toDos = ["Vhagar",
                 "Seasmoke",
                 "Syrax",
                 "Sunfyre",
                 "Vermax"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }
                }
            }
            .navigationBarTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
    }
}

#Preview {
    ToDoListView()
}
