//
//  MoneyTrackList.swift
//  Organizer
//
//  Created by user214012 on 3/6/22.
//

import Foundation

struct MoneyTrackList {
   var date: String?
   var items: [ListItem]?
    
    init(_ date: String, _ items: [ListItem]) {
            self.date = date
            self.items = items
        }
}

struct ListItem {
    var date: String?
    var name: String?
    var category: String?
    var amount : String?
     
    init(_ date: String, _ name: String, _ category: String, _ amount: String) {
        self.date = date
        self.name = name
        self.category = category
        self.amount = amount
    }
}
