//
//  AddTrackViewController.swift
//  Organizer
//
//  Created by user214012 on 3/6/22.
//

import UIKit
import DropDown

class AddTrackViewController: UIViewController {

    @IBOutlet weak var categoryField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var amountView: UIView!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    
    var financeManager : FinanceManager?
    
    let dropDown = DropDown()
    let catArray = ["Outgoing Payment", "Incoming Payment"]
    
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
        
        amountView.layer.borderColor = UIColor.lightGray.cgColor
        amountView.layer.borderWidth = 1
        amountView.layer.cornerRadius = 10
        amountView.layer.shadowOpacity = 0.3
        
        dropDown.anchorView = categoryField
        dropDown.dataSource = catArray
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.categoryField.text = catArray[index]
        }
    }
    
    @IBAction func show(_ sender: Any) {
        dropDown.show()
    }
    
    @IBAction func amountChanged(_ sender: UISlider) {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        let amount = formatter.string(from: NSNumber(value: sender.value))
        amountField.text = amount
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
        formatter.dateFormat = "dd-MM-yyyy"
        dateField.text = formatter.string(from: datePicker.date)
    }
    
    @objc func timeChange(datePicker: UIDatePicker)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        timeField.text = formatter.string(from: datePicker.date)
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
    
    @IBAction func addAmount(_ sender: Any) {
        financeManager!.addItem(selectedDate: dateField.text!, name: nameField.text!, category: categoryField.text!, amount: amountField.text!)
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
