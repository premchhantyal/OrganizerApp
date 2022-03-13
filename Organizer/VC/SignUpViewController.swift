//
//  SignUpViewController.swift
//  Organizer
//
//  Created by user214012 on 3/11/22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var email: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.borderStyle = UITextField.BorderStyle.roundedRect
        password.layer.shadowOpacity = 0.3
        
        name.borderStyle = UITextField.BorderStyle.roundedRect
        name.layer.shadowOpacity = 0.3
        
        email.borderStyle = UITextField.BorderStyle.roundedRect
        email.layer.shadowOpacity = 0.3
        
        signUpBtn.isUserInteractionEnabled = true
                
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.addPulse))
        tapGestureRecognizer.numberOfTapsRequired = 1
        signUpBtn.addGestureRecognizer(tapGestureRecognizer)
        
    }
    

    @objc func addPulse(){
        let pulse = AnimPulseView(numberOfPulses: 1, radius: 110, position: CGPoint(x: signUpBtn.center.x+20, y: 750))
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.red.cgColor
            
        self.view.layer.insertSublayer(pulse, below: signUpBtn.layer)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "LoginScreen") ;
            self.present(vc, animated: true, completion: nil);
        }
            
    }

}
