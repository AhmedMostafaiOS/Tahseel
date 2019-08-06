//
//  NavigationbarItemsViewController.swift
//  LawyerUp
//
//  Created by Abed Nayef Qasim on 2/12/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//


import UIKit
import UserNotifications

class NavigationbarItemsViewController: UIViewController, UNUserNotificationCenterDelegate
{
    var filterItem: UIBarButtonItem!
    var menuItem: UIBarButtonItem!
    var dismissItem:UIBarButtonItem!
    var statusNavigationIcon = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterItem = createButtonItem(buttonImage: #imageLiteral(resourceName: "filter"), targetAction:  #selector(filter))
        menuItem = createButtonItem(buttonImage: #imageLiteral(resourceName: "Menu Bar"), targetAction: #selector(showMenu))
        self.navigationItem.setRightBarButtonItems([filterItem], animated: true)
        self.navigationItem.setLeftBarButton(menuItem, animated: true)
    }
    
    @objc func dismissSearch() {
        navigationController?.popViewController(animated: true)
    }
    func updateImage(image:UIImage = #imageLiteral(resourceName: "ic_logo") , width:Float = 79.19)  {
        for item in navigationController?.navigationBar.subviews ?? [] {
            if item.isKind(of: UIImageView.self) ||  item.isKind(of: UILabel.self) {
                item.removeFromSuperview()
            }
        }
        let  imageSize:CGSize = CGSize(width:Int(width), height:22);
        let width = self.navigationController?.navigationBar.frame.width ?? 0
        let marginX:CGFloat = (width / 2) - (imageSize.width / 2);
        let logo = UIImageView(image: image)
        logo.frame = CGRect(x:marginX, y:10, width:imageSize.width, height:imageSize.height);
        self.navigationController?.navigationBar.addSubview(logo)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    func updateImageToLabel(message:String, width:Float = 120) {
        for item in navigationController?.navigationBar.subviews ?? [] {
            if item.isKind(of: UIImageView.self) ||  item.isKind(of: UILabel.self) {
                item.removeFromSuperview()
            }
        }
        let labelSize:CGSize = CGSize(width:Int(width), height:22);
        let width = self.navigationController?.navigationBar.frame.width ?? 0
        let marginX:CGFloat = (width / 2) - (labelSize.width / 2);
        let label = UILabel()
        label.text = message
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        label.frame = CGRect(x:marginX, y:10, width:labelSize.width, height:labelSize.height);
        self.navigationController?.navigationBar.addSubview(label)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    func updateImageToLabelWithoutLeft(message:String, width:Float = 120) {
        for item in navigationController?.navigationBar.subviews ?? [] {
            if item.isKind(of: UIImageView.self) ||  item.isKind(of: UILabel.self) {
                item.removeFromSuperview()
            }
        }
        let labelSize:CGSize = CGSize(width:Int(width), height:22);
        let width = self.navigationController?.navigationBar.frame.width ?? 0
        let marginX:CGFloat = (width / 2) - (labelSize.width / 2);
        let label = UILabel()
        label.text = message
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        label.frame = CGRect(x:marginX, y:10, width:labelSize.width, height:labelSize.height);
        self.navigationItem.leftBarButtonItem  = nil
        self.navigationController?.navigationBar.addSubview(label)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func defualtNaviagtion() {
        self.navigationItem.setRightBarButtonItems([], animated: true)
        self.navigationItem.setLeftBarButtonItems([], animated: true)
        self.navigationItem.hidesBackButton = true

    }
    @objc func filter() {
        
    }
    func createButtonItem(buttonImage: UIImage,targetAction: Selector?,title: String = "",tintColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) )-> UIBarButtonItem{
        let button = UIButton(type: .custom)
        button.setImage(buttonImage, for: .normal)
        button.tintColor = tintColor
        button.setTitle(title, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        // badge label
        if let action = targetAction {
            button.addTarget(self, action: action, for: .touchUpInside)
        }
        return UIBarButtonItem(customView: button)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    @objc func showMenu() {
        let vc = Helper.initViewControllerWith(identifier: "MenuViewController", and: "") as! MenuViewController
        show(vc, sender: nil)
    }
    
    
    
}
