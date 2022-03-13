//
//  AnimBlinkView.swift
//  Organizer
//
//  Created by user214012 on 3/11/22.
//

import UIKit

class AnimBlinkView: UIView {
    
    override func layoutSubviews() {
        UIView.animate(withDuration: 0.8,
                     delay:0.0,
                     options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                     animations: { self.alpha = 0 },
                     completion: nil)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
