//
//  QuantityView.swift
//  Mahalkom
//
//  Created by Wafaa Alshahed on 6/4/18.
//  Copyright © 2018 Line. All rights reserved.
//

import UIKit
@IBDesignable
class QuantityView: UIView {
    @IBOutlet weak var numberTextView: UITextField!
    var delegate:DetailViewController?
    var maxQuantity:Int = -1
    var productId:Int?
    var number:Int = 0
    var isPlus:Bool = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(loadViewFromNib(viewClass: self.classForCoder))
              numberTextView.textAlignment = .center
    }
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.addSubview(loadViewFromNib(viewClass: self.classForCoder))
        numberTextView.textAlignment = .center
    }
    @IBAction func minusButtonClick(_ sender: Any) {
        isPlus = false
        number = Int(numberTextView!.text!)!
        number = number - 1
        if (number <= 1) {
            number = 1
        }
        numberTextView.text = String(number)
    }
    @IBAction func plusButtonClick(_ sender: Any) {
        isPlus = true
        number  = Int(numberTextView!.text!)!
        number = number + 1
        numberTextView.text = String(number)
    }
}
