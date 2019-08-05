//
//  SizeCell.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/5/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class SizeCell: UICollectionViewCell {
    
    let textColor = #colorLiteral(red: 0.4, green: 0.4941176471, blue: 0.9176470588, alpha: 1)
    var backgoroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

    @IBOutlet weak var titleLabel: UILabel!
    override var isSelected: Bool {
        didSet{
            UIView.animate(withDuration: 0.30) { [weak self] in
                self?.titleLabel.textColor = self?.isSelected ?? false ? self?.backgoroundColor : self?.textColor
                self?.titleLabel.backgroundColor = self?.isSelected ?? false ? self?.textColor : self?.backgoroundColor
            }
        }
        
    }
}
