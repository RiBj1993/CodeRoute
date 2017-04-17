//
//  RoundedButton.swift
//  LoginForm
//
//  Created by SwiftR on 14/03/2017.
//  Copyright © 2017 vishalsonawane. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // round the edges by five pixels
        layer.cornerRadius = 5.0
        // clip sublayers to the layer's bound
        layer.masksToBounds = true
    }
    
}

