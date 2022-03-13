//
//  ToDoListViewController.swift
//  Organizer
//
//  Created by user214012 on 3/6/22.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var todoListTableView: UITableView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    var listManager : ReminderManager = ReminderManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reloadStackView()
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listManager.getAllToDoList().count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.listManager.getAllToDoList()[section]
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd YYYY"
        var today = formatter.string(from: Date())
        if (today == section.date) {
            return "Today"
        }
        
        return section.date
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listManager.getAllToDoList()[section].items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = self.listManager.getAllToDoList()[indexPath.section].items?[indexPath.row].name
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //reload table data to get updated data
        todoListTableView.reloadData()
        self.reloadStackView()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let managerVC = segue.destination as? ReminderViewController
        managerVC!.hidesBottomBarWhenPushed = true
        managerVC!.listManager = listManager
    }
    
    
    func reloadStackView()
    {
        var itemCount = self.listManager.getItemCountByCategory()
       
        stackView.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        let catArray = ["Work", "Family", "Urgent", "Other"]

        for var index in 0..<catArray.count {
            var cnt = itemCount[catArray[index]]?.count ?? 0
                    let dayView = ToDoUIView()
                        dayView.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
                dayView.catLabel.text = "\(catArray[index])"
            
            switch (catArray[index]) {
                case "Work" :
                    dayView.countLabel.text = "\(cnt)"
                    dayView.backgroundColor = .orange
                    dayView.catImageIcon.image = UIImage(named: "screen")
                    break
                
                case "Family" :
                    dayView.countLabel.text = "\(cnt)"
                    dayView.backgroundColor = .blue
                    dayView.catImageIcon.image = UIImage(named: "family")
                    break
                
                case "Urgent" :
                    dayView.countLabel.text = "\(cnt)"
                    dayView.backgroundColor = .purple
                    dayView.catImageIcon.image = UIImage(named: "clock")
                    break
                
                default:
                    dayView.countLabel.text = "\(cnt)"
                    dayView.backgroundColor = .lightGray
                    dayView.catImageIcon.image = UIImage(named: "circle-blue")
                    break
            
            }

            stackView.addArrangedSubview(dayView)
        }
        
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: 300 * CGFloat(5), height: scrollView.frame.size.height)
    }

}

