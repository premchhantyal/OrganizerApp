//
//  EventManager.swift
//  Organizer
//
//  Created by user214012 on 3/7/22.
//

import Foundation

class EventManager {
    
    var eventList = [
        CalendarEvent("04 09 2022", ["Daily meeting with team","Find people for the user test","Buy cookies"]),
        CalendarEvent("04 01 2022", ["Pay Bills","Daily meeting with team","Find people for the user test","Buy cookies"])
    ]
    
  
    func addItem(date: String, item : String) {
        if var todo = eventList.first(where: { $0.date == date }) {
            todo.items?.append(item)
            eventList[eventList.firstIndex(where: { $0.date == date })!] = todo
        } else {
            eventList.append(CalendarEvent(date, [item]))
        }
    }
    
    //return the collection of purchase history data
    func getAllEventsList() -> [CalendarEvent]{
        return eventList
    }
}
