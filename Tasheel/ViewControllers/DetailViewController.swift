//
//  DetailViewController.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/5/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit
import FSPagerView
class DetailViewController: UIViewController {
    @IBOutlet weak var imageSlider: FSPagerView!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var raviewCountLabel: UILabel!
    @IBOutlet weak var titleRateLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var newPriceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addCartButton: UIButton!
    @IBOutlet weak var buyNowButton: UIButton!
    @IBOutlet weak var quantity: QuantityView!
    let colorList:[UIColor] = [#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) , #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) , #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1) , #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1) , #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1) , #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1) ,  #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)]
    let sizeList:[String] = ["S" , "M" , "L" , "XL" , "XLL"]
    let imageList:[UIImage] = [#imageLiteral(resourceName: "3") , #imageLiteral(resourceName: "4") , #imageLiteral(resourceName: "1")]
    
    @IBOutlet weak var favorite: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        colorCollectionView.register(ColorCell.self)
        sizeCollectionView.register(SizeCell.self)
        imageSlider.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        imageSlider.automaticSlidingInterval = 3.0
        imageSlider.isInfinite = true
        imageSlider.delegate = self
        imageSlider.dataSource = self
        addCartButton.isHidden = true
    }
    
    
    @IBAction func Favorite(_ sender: Any) {
        alert(message: favorite.imageView?.image == #imageLiteral(resourceName: "ic_favorite_fill") ? "Remove Favorite Successfully" : "Add Favorite Successfully",title: "",completion: {
            
        })
        favorite.setImage(favorite.imageView?.image == #imageLiteral(resourceName: "ic_favorite_fill") ? #imageLiteral(resourceName: "ic_favorite_stroke") : #imageLiteral(resourceName: "ic_favorite_fill"), for: .normal)
    }
    
    @IBAction func AddCart(_ sender: Any) {
        alert(message: "Add Successfully",title: "",completion: {
           
        })
        addCartButton.isHidden = buyNowButton.titleLabel?.text ?? "" == "Buy Now" ? false : true
        buyNowButton.setTitle(addCartButton.isHidden ? "Buy Now":"Cancel", for: .normal)

    }
    
    @IBAction func Buy(_ sender: Any) {
        addCartButton.isHidden = buyNowButton.titleLabel?.text ?? "" == "Buy Now" ? false : true
        buyNowButton.setTitle(addCartButton.isHidden ? "Buy Now":"Cancel", for: .normal)

    }
    
}
extension DetailViewController:FSPagerViewDelegate,FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.imageList.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = imageList[index]
        cell.imageView?.contentMode = .scaleAspectFill
        return cell
    }
}
extension DetailViewController:UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ( collectionView == colorCollectionView ) {
            return  colorList.count
        }
        return sizeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == colorCollectionView {
            let cell:ColorCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            cell.layer.cornerRadius = cell.frame.height / 2
            cell.view_bg.backgroundColor = colorList[indexPath.row]
            return cell
        }
        let cell:SizeCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.titleLabel.text = sizeList[indexPath.row]
        cell.layer.cornerRadius = 10

        return cell
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView == colorCollectionView ? CGSize.init(width: 40, height: 40) :  CGSize(width: 70, height: 43)
    }
}


