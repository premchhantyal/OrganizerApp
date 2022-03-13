//
//  AnimShakeView.swift
//  Organizer
//
//  Created by user214012 on 3/11/22.
//

import UIKit

class AnimShakeView: UIView {
    @IBInspectable var delay : Double = 0.0
    
    override func layoutSubviews() {
        self.transform = CGAffineTransform(translationX: 10, y: 0)
        UIView.animate(withDuration: 0.4, delay: 2, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
            UIView.modifyAnimations(withRepeatCount: 3, autoreverses: true, animations: {
                self.transform = CGAffineTransform.identity
                })
                    
                }, completion: nil)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
