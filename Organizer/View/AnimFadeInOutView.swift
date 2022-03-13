//
//  AnimFadeInOutView.swift
//  Organizer
//
//  Created by user214012 on 3/11/22.
//

import UIKit

class AnimFadeInOutView: UIView {

    enum RepeatAnimation : Int {
        case no = 0
        case yes = 1
    }
    
    @IBInspectable var isRepeat : Int = 0
    @IBInspectable var delay : Double = 1.0
    
    override func layoutSubviews() {
        initAnim()
        if self.isRepeat == RepeatAnimation.yes.rawValue {
            UIView.animate(withDuration: 0.5, delay: self.delay, options: [UIView.AnimationOptions.autoreverse, UIView.AnimationOptions.repeat],
                animations: {
                self.alpha = 3.0
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: self.delay, options: .curveEaseIn,
                animations: {
                self.alpha = 3.0
            }, completion: nil)
        }
    }
    
    func initAnim() {
        self.alpha = 0.0
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
