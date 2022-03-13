//
//  AnimShrinkExpandView.swift
//  Organizer
//
//  Created by user214012 on 3/11/22.
//

import UIKit

class AnimShrinkExpandView: UIView {
    @IBInspectable var delay : Double = 0.0
    
    override func layoutSubviews() {
        UIView.animate(withDuration: 2, delay: 0, options: [.autoreverse], animations: {
            self.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        })
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
