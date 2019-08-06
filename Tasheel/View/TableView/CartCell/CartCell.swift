//
//  CartCell.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/6/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    @IBOutlet weak var quantityProductView: QuantityView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productsubTitleLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    var deleteProductBlock:(()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(product:Product)  {
        productPriceLabel.text = product.salary
        productNameLabel.text = product.name
        productImageView.image = product.image
        productsubTitleLabel.text = "Lotto.LTD"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteProduct(_ sender: Any) {
        guard let deleteProductBlock = deleteProductBlock else {
            return
        }
        deleteProductBlock()
    }
    
}
