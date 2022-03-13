//
//  SettingsViewController.swift
//  Organizer
//
//  Created by user214012 on 3/7/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var upgradeView: UIView!
    @IBOutlet weak var rateView: UIView!
    @IBOutlet weak var generalView: UIView!
    @IBOutlet weak var activeView1: UIView!
    @IBOutlet weak var activeView2: UIView!
    @IBOutlet weak var activeView3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        upgradeView.layer.borderColor = UIColor.lightGray.cgColor
        upgradeView.layer.borderWidth = 1
        upgradeView.layer.cornerRadius = 10
        upgradeView.layer.shadowOpacity = 0.3
        
        rateView.layer.borderColor = UIColor.lightGray.cgColor
        rateView.layer.borderWidth = 1
        rateView.layer.cornerRadius = 10
        rateView.layer.shadowOpacity = 0.3
        
        generalView.layer.borderColor = UIColor.lightGray.cgColor
        generalView.layer.borderWidth = 1
        generalView.layer.cornerRadius = 10
        generalView.layer.shadowOpacity = 0.3
        
        activeView1.layer.borderColor = UIColor.lightGray.cgColor
        activeView1.layer.borderWidth = 1
        activeView1.layer.cornerRadius = 10
        activeView1.layer.shadowOpacity = 0.3
        
        activeView2.layer.borderColor = UIColor.lightGray.cgColor
        activeView2.layer.borderWidth = 1
        activeView2.layer.cornerRadius = 10
        activeView2.layer.shadowOpacity = 0.3
        
        activeView3.layer.borderColor = UIColor.lightGray.cgColor
        activeView3.layer.borderWidth = 1
        activeView3.layer.cornerRadius = 10
        activeView3.layer.shadowOpacity = 0.3
        
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
