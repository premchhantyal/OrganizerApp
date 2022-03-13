//
//  ReminderManager.swift
//  Organizer
//
//  Created by user214012 on 3/6/22.
//

import Foundation
class ReminderManager {
    
    var toDoList = [
        ToDoList("Mar 12 2022", [ToDoItem("Daily meeting with team","Work","this is my first reminer"),ToDoItem("Find people for the user test","Urgent","this is my first reminer")]),
        
    ]
    
  
    func addItem(date: String, name : String, category: String, notes: String) {
        var newItem = ToDoItem(name, category, notes)
        if var todo = toDoList.first(where: { $0.date == date }) {
            todo.items?.append(newItem)
            toDoList[toDoList.firstIndex(where: { $0.date == date })!] = todo
        } else {
            toDoList.append(ToDoList(date, [newItem]))
        }
        
    }
    
    //return the collection of purchase history data
    func getAllToDoList() -> [ToDoList]{
        return toDoList
    }
    
    func getItemCountByCategory() -> [String?: [ToDoItem]]
    {
        let list = toDoList.flatMap { $0.items! }
        let itemsCount = Dictionary(grouping: list, by: { $0.category })
        
        return itemsCount
    }
}
