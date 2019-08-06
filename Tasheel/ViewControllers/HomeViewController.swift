//
//  HomeViewController.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/4/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class HomeViewController: NavigationbarItemsViewController {
    
    @IBOutlet weak var productCollectionTabelView: UITableView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    var categoryList:[Category] = []
    var productGroupList:[ProductGroup] = []
    var productList:[Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.register(CategoryCell.self)
        productCollectionTabelView.register(ProductGourpCell.self)
        productCollectionTabelView.estimatedRowHeight = 227
        productCollectionTabelView.rowHeight = UITableView.automaticDimension
        setup()
    }
    
    func setup() {
        categoryList.append(Category.init(name: "Woman", color: #colorLiteral(red: 0.4, green: 0.4941176471, blue: 0.9176470588, alpha: 0.7), image: #imageLiteral(resourceName: "womanImage")))
        categoryList.append(Category.init(name: "Man", color: #colorLiteral(red: 1, green: 0.3450980392, blue: 0.3450980392, alpha: 0.7), image: #imageLiteral(resourceName: "manImage")))
        categoryList.append(Category.init(name: "Kids", color: #colorLiteral(red: 0.2938658893, green: 0.9145204425, blue: 0.5551404953, alpha: 0.7), image: #imageLiteral(resourceName: "kidsImage")))
        productList.append(Product.init(name: "Woman T-Shirt", salary: "$ 34.00", image: #imageLiteral(resourceName: "1")))
        productList.append(Product.init(name: "Man T-Shirt", salary: "$ 34.00", image: #imageLiteral(resourceName: "2")))
        productList.append(Product.init(name: "Woman T-Shirt", salary: "$ 34.00", image: #imageLiteral(resourceName: "3")))
        productGroupList.append(ProductGroup.init(title: "Featured", productList:productList ))
        productList.removeAll()
        productList.append(Product.init(name: "Woman T-Shirt", salary: "$ 24.00", image:   #imageLiteral(resourceName: "5") ))
        productList.append(Product.init(name: "Man T-Shirt", salary: "$ 24.00", image: #imageLiteral(resourceName: "6")))
        productList.append(Product.init(name: "Woman T-Shirt", salary: "$ 24.00", image: #imageLiteral(resourceName: "3")))
        productGroupList.append(ProductGroup.init(title: "Best Sell", productList:productList ))
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(false, animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
        updateImageToLabel(message: "Home")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
extension HomeViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productGroupList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ProductGourpCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setup(title: productGroupList[indexPath.row].title, productList: productGroupList[indexPath.row].productList)
        cell.configureCell()
        cell.didSelectItemCollectionView = { index in
            let vc = Helper.initViewControllerWith(identifier: "ListViewController", and: "")
            self.show(vc, sender: nil)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
}
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CategoryCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setup(image: categoryList[indexPath.row].image, color: categoryList[indexPath.row].color, name: categoryList[indexPath.row].name)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 89)
    }
    
    
}
