//
//  AnimUpDownView.swift
//  Organizer
//
//  Created by user214012 on 3/11/22.
//

import UIKit

class AnimUpDownView: UIView {
    enum Direction: Int {
        case FromUp = 0
        case FromDown = 1
    }
    
    @IBInspectable var direction : Int = 0
    @IBInspectable var delay : Double = 0.0
    
    override func layoutSubviews() {
        initAnim()
        UIView.animate(withDuration: 0.5, delay: self.delay, options: .curveEaseIn,
            animations: {
            if let s = self.superview {
                if self.direction == Direction.FromDown.rawValue {
                    self.center.y += 400
                } else {
                    self.center.y -= 400
                }
            }
        }, completion: nil)
    }
    
    func initAnim() {
        if let s = self.superview {
            if direction == Direction.FromDown.rawValue {
                self.center.y -= 400
            } else {
                self.center.y += 400
            }
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
