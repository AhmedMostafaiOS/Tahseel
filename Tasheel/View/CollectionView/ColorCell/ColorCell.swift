//
//  ColorCell.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/5/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class ColorCell: UICollectionViewCell {
    @IBOutlet weak var view_bg: UIView!
    override var isSelected: Bool {
        didSet{
            UIView.animate(withDuration: 0.30) { [weak self] in
                self?.layer.borderColor = self?.isSelected ?? false ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                self?.layer.borderWidth = self?.isSelected ?? false ? 2 : 0

            }
        }
        }
}
