//
//  ToDoListView.swift
//  ToDoList
//
//  Created by TheForce on 9/29/24.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    DetailView()
                } label: {
                    Image(systemName: "eye")
                    Text("The Sky is The Limit")
                }
                .font(.title2)
                .fontWeight(.semibold)
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    ToDoListView()
}
