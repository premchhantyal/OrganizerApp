//
//  ViewController.swift
//  Organizer
//
//  Created by user214012 on 3/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    var str = "Welcome!!!!!"
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoImageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoImageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate()
        })
    }
    
    private func animate() {
        UIView.animate(withDuration: 1,animations: {
            let size = self.view.frame.size.width * 2
            let diffX = size - self.view.frame.width
            let diffY = self.view.frame.size.height - size
            
            self.logoImageView.frame = CGRect(
                x: -(diffX/2), y: diffY/2, width: size, height: size
            )
            
        })
        
        UIView.animate(withDuration: 1.1,animations: {
            self.logoImageView.alpha = 0
            self.welcomeLabel.isHidden = false
            
            for i in self.str {
                if(self.welcomeLabel.text!.count == self.str.count){
                    break;
                }
                self.welcomeLabel.text! += "\(i)"
                RunLoop.current.run(until: Date()+0.32)
            }
            
        }, completion: { done in
            if done {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil);
                let vc = storyboard.instantiateViewController(withIdentifier: "signupScreen") ;
                self.present(vc, animated: true, completion: nil);
            }
            
        })
        
    }

    
}

