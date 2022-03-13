//
//  AnimRotationView.swift
//  Organizer
//
//  Created by user214012 on 3/11/22.
//

import UIKit

class AnimRotationView: UIView {
    @IBInspectable var delay : Double = 0.0
    
    override func layoutSubviews() {
        initAnim()
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .curveEaseInOut , .allowUserInteraction], animations: {
            //self.transform = CGAffineTransform(rotationAngle: 10.0)
            self.transform = self.transform.rotated(by: .pi / 2)
        })
    }
    
    func initAnim() {
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
