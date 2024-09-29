//
//  DetailView.swift
//  ToDoList
//
//  Created by TheForce on 9/29/24.
//

import SwiftUI

struct DetailView: View {
    var passedValue: String // Don't initialize - it will be passed from the parent view
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text("velocity = ⁠dr/dt!\nAnd you passed over the value \(passedValue) ")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Get Back!") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        //.navigationBarBackButtonHidden()
    }
}

#Preview {
    DetailView(passedValue: "Item 1")
}
