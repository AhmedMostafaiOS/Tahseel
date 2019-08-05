//
//  ProductGourpCell.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/4/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class ProductGourpCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var productList:[Product] = []
    var didSelectItemCollectionView:((Int)->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(ProductCell.self)
    }
    func setup(title:String, productList:[Product])  {
        self.productList.removeAll()
        titleLabel.text = title
        self.productList.append(contentsOf: productList)
    }
    func configureCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func seeAll(_ sender: Any) {
        
    }
    
}

extension ProductGourpCell:UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ProductCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setup(product: productList[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 172, height: 255)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let didSelectItemCollectionView = didSelectItemCollectionView else {
            return
        }
        didSelectItemCollectionView(indexPath.row)
    }
}

