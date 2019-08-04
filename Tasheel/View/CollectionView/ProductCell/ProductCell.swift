//
//  ProductCell.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/4/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    func setup(product:Product)  {
        nameLabel.text = product.name
        salaryLabel.text = product.salary
        photoImageView.image = product.image
    }
}
