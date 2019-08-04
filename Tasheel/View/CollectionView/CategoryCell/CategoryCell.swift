//
//  CategoryCell.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/4/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    func setup(image:UIImage , color:UIColor , name:String)  {
        photoImageView.image = image
        innerView.backgroundColor = color
        nameLabel.text = name
    }
    
}
