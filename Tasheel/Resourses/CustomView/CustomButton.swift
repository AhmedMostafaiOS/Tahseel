//
//  CustomButton.swift
//  Mahalkom
//
//  Created by Wafaa Alshahed on 12/11/18.
//  Copyright © 2018 Line. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    @IBInspectable var hasRoundedCorners: Bool = true {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var hasOneSideCorners: Bool = false {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var titleColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) {
        didSet {
          updateView()
        }
    }
    
    
    func  updateView(){
        layer.cornerRadius = hasRoundedCorners ? frame.height / 2 : 0
        setTitleColor(titleColor, for: .normal)
      //  titleLabel?.font = Constants.fonts.font
        
        if hasOneSideCorners {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners:[.topRight, .bottomRight], cornerRadii: CGSize(width: frame.height / 2 , height:  frame.height / 2))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            layer.mask = maskLayer
        }
    }
}
