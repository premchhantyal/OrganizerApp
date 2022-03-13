//
//  FinanceManager.swift
//  Organizer
//
//  Created by user214012 on 3/6/22.
//

import Foundation
class FinanceManager {
    
    var trackList = [
        MoneyTrackList("Jan 2021", [ListItem("01-01-2021", "Amazon", "Incoming Payment", "$2,100"),ListItem("01-01-2021", "Amazon", "Outgoing Payment", "$2,100")]),
        MoneyTrackList("Feb 2021", [ListItem("01-02-2021", "Amazon2", "Outgoing Payment", "$2,100"),ListItem("01-02-2021", "Amazon2", "Outgoing Payment", "$2,100")]),
    ]
    
  
    func addItem(selectedDate: String, name : String, category : String, amount : String) {
        print(selectedDate)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        var d = formatter.date(from: selectedDate)
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "MMM dd"
        var monthDay = formatter2.string(from: d!)
        
        var newItem = ListItem(selectedDate, name, category, amount)
        
        if var list = trackList.first(where: { $0.date == monthDay }) {
            list.items?.append(newItem)
            trackList[trackList.firstIndex(where: { $0.date == monthDay })!] = list
        } else {
            trackList.append(MoneyTrackList(monthDay, [newItem]))
        }
    }
    
    //return the collection of purchase history data
    func getAllTrackingList() -> [MoneyTrackList]{
        return trackList
    }
    
}
