//
//  ListViewController.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/5/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class ListViewController: NavigationbarItemsViewController {
    @IBOutlet weak var productCollectionView: UICollectionView!
    var productList:[Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        productCollectionView.register(ProductCell.self)
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateImageToLabel(message: "Product List")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    func setup() {
        productList.append(Product.init(name: "Woman T-Shirt", salary: "$ 34.00", image: #imageLiteral(resourceName: "1")))
        productList.append(Product.init(name: "Man T-Shirt", salary: "$ 34.00", image: #imageLiteral(resourceName: "2")))
        productList.append(Product.init(name: "Woman T-Shirt", salary: "$ 34.00", image: #imageLiteral(resourceName: "3")))
        productList.append(Product.init(name: "Woman T-Shirt", salary: "$ 24.00", image:   #imageLiteral(resourceName: "5") ))
        productList.append(Product.init(name: "Man T-Shirt", salary: "$ 24.00", image: #imageLiteral(resourceName: "6")))
        productList.append(Product.init(name: "Woman T-Shirt", salary: "$ 24.00", image: #imageLiteral(resourceName: "3")))
    }

}
extension ListViewController:UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ProductCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setup(product: productList[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth =  collectionView.frame.width
        let width =  (screenWidth - (8 * 2) - 8) / 2
        return CGSize(width:width, height: 255)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = Helper.initViewControllerWith(identifier: "DetailViewController", and: "") as! DetailViewController
        show(vc, sender: nil)
    }
}

