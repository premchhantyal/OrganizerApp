//
//  CalendarEvent.swift
//  Organizer
//
//  Created by user214012 on 3/7/22.
//

import Foundation

struct CalendarEvent {
   var date: String?
   var items: [String]?
    
    init(_ date: String, _ items: [String]) {
            self.date = date
            self.items = items
        }
}
