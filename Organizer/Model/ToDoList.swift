//
//  ToDoList.swift
//  Organizer
//
//  Created by user214012 on 3/6/22.
//

import Foundation

struct ToDoList {
   var date: String?
    var items: [ToDoItem]?
     
     init(_ date: String, _ items: [ToDoItem]) {
             self.date = date
             self.items = items
         }
 }

 struct ToDoItem {
     var name: String?
     var category: String?
     var notes : String?
      
     init(_ name: String, _ category: String, _ notes: String)
     {
         self.name = name
         self.category = category
         self.notes = notes
     }
 }


