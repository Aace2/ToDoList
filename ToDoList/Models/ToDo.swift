//
//  ToDo.swift
//  ToDoList
//
//  Created by TheForce on 9/30/24.
//

import Foundation
import SwiftData

@MainActor
@Model
class ToDo {
    var item: String = ""
    var reminderIsOn = false
    var dueDate = Date.now + 60*60*24
    var notes = ""
    var isCompleted = false
    
    init(item: String = "", reminderIsOn: Bool = false, dueDate: Date = Date.now + 60*60*24, notes: String = "", isCompleted: Bool = false) {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
        self.notes = notes
        self.isCompleted = isCompleted
    }
    
    
    
}

extension ToDo {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        // Add mock data
        container.mainContext.insert(ToDo(item: "Vhagar", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "The largest of the dragon", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Seasmoke", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "The dragon of the sea", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Silverwing", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "Vermithor's friend", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Vermithor", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "One of the oldest living dragins", isCompleted: false))
        
        return container
    }
}







