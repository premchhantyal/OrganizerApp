//
//  ToDoUIView.swift
//  Organizer
//
//  Created by user214012 on 3/8/22.
//

import UIKit

class ToDoUIView: UIView {
    
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var catImageIcon: UIImageView!
    @IBOutlet weak var catLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let viewFromXib = Bundle.main.loadNibNamed("ToDoUIView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
