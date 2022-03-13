//
//  LoginViewController.swift
//  Organizer
//
//  Created by user214012 on 3/6/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        password.borderStyle = UITextField.BorderStyle.roundedRect
        password.layer.shadowOpacity = 0.3
        
        name.borderStyle = UITextField.BorderStyle.roundedRect
        name.layer.shadowOpacity = 0.3
        
    }
    

    @IBAction func loginClicked(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "TabScreen") ; // MySecondSecreen the storyboard ID
            self.present(vc, animated: true, completion: nil);
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
