//
//  MoneyTrackerViewController.swift
//  Organizer
//
//  Created by user214012 on 3/6/22.
//

import UIKit

class MoneyTrackerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var trackingListTableView: UITableView!
    @IBOutlet weak var trackedMonth: UILabel!
    @IBOutlet weak var remainingView: UIView!
    @IBOutlet weak var monthRemainingLabel: UILabel!
    @IBOutlet weak var remainingAmountLabel: UILabel!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var statisticsView: UIView!
    @IBOutlet weak var movementView: UIView!
    
    let formatter: DateFormatter = DateFormatter()
    
    var financeManager : FinanceManager = FinanceManager()
    var dates : [String]?
    var counter : Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dates = financeManager.getAllTrackingList().map { $0.date! }
        trackedMonth.text = dates![counter]
        
        backImageView.image = UIImage(named: "rectangle262")
        backImageView.contentMode =  UIView.ContentMode.scaleAspectFill
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (dates!.count > 0) {
            let items = financeManager.getAllTrackingList().first(where: { $0.date == dates![counter] })
            return items!.items?.count ?? 0
            
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "financeCell", for: indexPath) as! FinanceTableViewCell
        let items = financeManager.getAllTrackingList().first(where: { $0.date == dates![counter] })
        
        let fullDate = items!.items?[indexPath.row].date
        let category = items!.items?[indexPath.row].category
        var amountSign = "+"
        var imgName = "arrow-down"
        if (category == "Outgoing Payment") {
            amountSign = "-"
            imgName = "arrow-up"
        }
        let amount = (items!.items?[indexPath.row].amount) ?? ""
        
        cell.imageView?.image = UIImage(named: imgName)
        cell.nameLabel?.text = items!.items?[indexPath.row].name
        cell.typeLabel?.text = "\(category!) | \(fullDate!)"
        cell.amountLabel?.text = "\(String(amountSign)) \(amount)"
        
        return cell
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        self.counter += 1
        if (self.counter < dates!.count)
        {
            trackedMonth.text = dates![counter]
            self.trackingListTableView.reloadData()
        }
    }
    
    @IBAction func previousButtonClicked(_ sender: Any) {
        self.counter -= 1
        if(self.counter >= 0) {
            trackedMonth.text = dates![counter]
            self.trackingListTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //reload table data to get updated data
        self.counter = 0
        self.dates = financeManager.getAllTrackingList().map { $0.date! }
        self.trackedMonth.text = dates![counter]
        self.trackingListTableView.reloadData()
    }
    
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            self.statisticsView.isHidden = false
            self.movementView.isHidden = true
        } else {
            self.statisticsView.isHidden = true
            self.movementView.isHidden = false
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let managerVC = segue.destination as? AddTrackViewController
        managerVC!.hidesBottomBarWhenPushed = true
        managerVC!.financeManager = financeManager
    }
    

}
