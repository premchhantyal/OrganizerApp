//
//  ReminderViewController.swift
//  Organizer
//
//  Created by user214012 on 3/6/22.
//

import UIKit
import DropDown

class ReminderViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var categoryField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var notesField: UITextView!
    
    var listManager: ReminderManager?
    
    let dropDown = DropDown()
    let catArray = ["Work", "Family", "Urgent", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        nameField.borderStyle = UITextField.BorderStyle.roundedRect
        nameField.layer.shadowOpacity = 0.3
        
        categoryField.borderStyle = UITextField.BorderStyle.roundedRect
        categoryField.layer.shadowOpacity = 0.3
        
        dateField.borderStyle = UITextField.BorderStyle.roundedRect
        dateField.layer.shadowOpacity = 0.3
        
        timeField.borderStyle = UITextField.BorderStyle.roundedRect
        timeField.layer.shadowOpacity = 0.3
        
        notesField.layer.borderColor = UIColor.lightGray.cgColor
        notesField.layer.borderWidth = 1
        notesField.layer.cornerRadius = 10
        notesField.layer.shadowOpacity = 0.3
        
        dropDown.anchorView = categoryField
        dropDown.dataSource = catArray
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.categoryField.text = catArray[index]
        }
        
    
    }
    
    @IBAction func showCatOptions(_ sender: Any) {
        dropDown.show()
    }
    
    
    @IBAction func showDateOption(_ sender: Any) {
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
    
    @IBAction func addReminder(_ sender: Any) {
        listManager!.addItem(date: dateField.text!, name: nameField.text!, category: categoryField.text!, notes: notesField.text!)
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
