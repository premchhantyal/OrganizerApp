//
//  CalendarViewController.swift
//  Organizer
//
//  Created by user214012 on 3/7/22.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController,
                              FSCalendarDelegate, FSCalendarDataSource,
                              UITableViewDelegate, UITableViewDataSource
{
    var eventManager : EventManager = EventManager()
    var formatter : DateFormatter = DateFormatter()
    var selectedDate : Date = Date()
    var eventItems: CalendarEvent?
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateValues(date: selectedDate)
//        formatter.dateFormat = "MMM dd YYYY"
//        selectedDate = formatter.string(from: self.today)
//
//        eventItems = eventManager.getAllEventsList().first(where: { $0.date == selectedDate }) ?? nil
//
//        formatter.dateFormat = "MMM dd"
//        selectedDateLabel.text = formatter.string(from: self.today)
        
        // Do any additional setup after loading the view.
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let eventList = eventManager.getAllEventsList()
        let dates = eventList.map { $0.date! }
        formatter.dateFormat = "MMM dd YYYY"
        let calendarDate = formatter.string(from: date)
        
        if(dates.contains(calendarDate)) {
            guard let itemsCount = eventList.first(where: { $0.date == calendarDate })?.items?.count else {return 0}
            return itemsCount
        }
        return 0
        
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.updateValues(date: date)
        listTableView.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let managerVC = segue.destination as? EventViewController
        managerVC!.hidesBottomBarWhenPushed = true
        managerVC!.eventManager = eventManager
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //reload table data to get updated data
        self.updateValues(date: selectedDate)
        listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.eventItems?.items!.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! UITableViewCell
        var eventName = "NA"
        if(self.eventItems != nil) {
            eventName = (self.eventItems?.items![indexPath.row])!
        }
        
        cell.textLabel?.text = "8:00"
        cell.detailTextLabel?.text = eventName           
        
        return cell
    }
    
    func updateValues(date: Date) {
        formatter.dateFormat = "MMM dd YYYY"
        var dateString = formatter.string(from: date)
        eventItems = eventManager.getAllEventsList().first(where: { $0.date == dateString }) ?? nil
        formatter.dateFormat = "MMM dd"
        selectedDateLabel.text = formatter.string(from: date)
    }
    
    @IBAction func changeCalendarScope(_ sender: Any) {
        if (calendar.scope == .week) {
            calendar.scope = .month
        }else {
            calendar.scope = .week
        }
    }
    
}
