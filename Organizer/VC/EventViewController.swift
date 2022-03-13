//
//  EventViewController.swift
//  Organizer
//
//  Created by user214012 on 3/7/22.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var notificationField: UIView!
    @IBOutlet weak var notesField: UITextView!
    
    var eventManager: EventManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.borderStyle = UITextField.BorderStyle.roundedRect
        nameField.layer.shadowOpacity = 0.3
        
        notificationField.layer.borderColor = UIColor.lightGray.cgColor
        notificationField.layer.borderWidth = 1
        notificationField.layer.cornerRadius = 10
        notificationField.layer.shadowOpacity = 0.3
        
        dateField.borderStyle = UITextField.BorderStyle.roundedRect
        dateField.layer.shadowOpacity = 0.3
        
        timeField.borderStyle = UITextField.BorderStyle.roundedRect
        timeField.layer.shadowOpacity = 0.3
        
        notesField.layer.borderColor = UIColor.lightGray.cgColor
        notesField.layer.borderWidth = 1
        notesField.layer.cornerRadius = 10
        notesField.layer.shadowOpacity = 0.3
    }
    
    @IBAction func showDatePicker(_ sender: Any) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        dateField.inputView = datePicker
        dateField.becomeFirstResponder()
    }
    
    @IBAction func showTimePicker(_ sender: Any) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.addTarget(self, action: #selector(timeChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        timeField.inputView = datePicker
        timeField.becomeFirstResponder()
    }
    
    @objc func dateChange(datePicker: UIDatePicker)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd YYYY"
        dateField.text = formatter.string(from: datePicker.date)
    }
    
    @objc func timeChange(datePicker: UIDatePicker)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        timeField.text = formatter.string(from: datePicker.date)
    }
    
    @IBAction func addEvent(_ sender: Any) {
        eventManager!.addItem(date: dateField.text!, item: nameField.text!)
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
