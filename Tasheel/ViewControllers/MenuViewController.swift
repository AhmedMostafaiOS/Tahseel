//
//  MenuViewController.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/5/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    var menuList:[String] = ["Home" , "Profile" , "My Cart" , "Favorite" , "My Orders" , "Settings"  , "Login"]
    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.register(SideMenuCell.self)
        if let _ = AuthService.CURRENT_USER {
            menuList.remove(at: menuList.count - 1)
            menuList.append("Logout")
        }
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(true, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setToolbarHidden(false, animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    @IBAction func Dismiss(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension MenuViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SideMenuCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.3):#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.titleLabel.text = menuList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            //home
            let vc = Helper.initViewControllerWith(identifier: "HomeNavigationController", and: "")
            self.show(vc, sender: nil)
            break
        case 1:
            //Profile
            break
        case 2:
            //My Cart
            let vc = Helper.initViewControllerWith(identifier: "CartViewController", and: "") as! CartViewController
            self.show(vc, sender: nil)
            break
            
        case 3:
            //Favorite
            break
        case 4:
            //My Orders
            break
        case 5:
            // Settings
            break
        case 6:
            // Logout or Login
            if let _ = AuthService.CURRENT_USER {
                AuthService.logout(onSuccess: {
                    let vc = Helper.initViewControllerWith(identifier: "ChooseViewController", and: "")
                    self.show(vc, sender: nil)
                }) { (error) in
                    self.alert(message: error ?? "", title: "")

                }
            }else {
                let vc = Helper.initViewControllerWith(identifier: "ChooseViewController", and: "")
                self.show(vc, sender: nil)
            }
            break
        default:
            break
        }
    }
    
}
