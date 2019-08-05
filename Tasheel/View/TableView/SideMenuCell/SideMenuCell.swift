//
//  SideMenuCell.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/5/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }

}
