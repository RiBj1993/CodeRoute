//
//  RoundedLabel.swift
//  LoginForm
//
//  Created by SwiftR on 14/03/2017.
//  Copyright © 2017 vishalsonawane. All rights reserved.
//

import UIKit
class RoundedLabel: UILabel {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // round the edges by five pixels
        layer.cornerRadius = 5.0
        // clip sublayers to the layer's bound
        layer.masksToBounds = true
    }
    
    
    override func drawText(in rect: CGRect) {
        // define a rect to be used to allow padding
        let newRect = rect.insetBy(dx: 8.0, dy: 8.0)
        // call the super drawText method with the new Rect
        super.drawText(in: newRect)
    }
    
}
