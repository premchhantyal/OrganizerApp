//
//  AnimLeftRightView.swift
//  Organizer
//
//  Created by user214012 on 3/11/22.
//

import UIKit

class AnimLeftRightView: UIView {
    
    enum Direction: Int {
        case FromLeft = 0
        case FromRight = 1
    }
    
    @IBInspectable var direction : Int = 0
    @IBInspectable var delay : Double = 0.0
    
    override func layoutSubviews() {
        initAnim()
        UIView.animate(withDuration: 0.5, delay: self.delay, options: .curveEaseIn,
            animations: {
            if let s = self.superview {
                if self.direction == Direction.FromLeft.rawValue {
                    self.center.x += s.bounds.width
                } else {
                    self.center.x -= s.bounds.width
                }
            }
        }, completion: nil)
    }
    
    func initAnim() {
        if let s = self.superview {
            if direction == Direction.FromLeft.rawValue {
                self.center.x -= s.bounds.width
            } else {
                self.center.x += s.bounds.width
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

