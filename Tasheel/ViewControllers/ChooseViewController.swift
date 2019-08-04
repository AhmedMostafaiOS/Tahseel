//
//  ChooseViewController.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/4/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(true, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    @IBAction func Login(_ sender: Any) {
       
        let vc = Helper.initViewControllerWith(identifier: "LoginViewController", and: "") as! LoginViewController
        self.show(vc, sender: nil)
    }
    
    @IBAction func SignUp(_ sender: Any) {
        let vc = Helper.initViewControllerWith(identifier: "SignUpViewController", and: "") as! SignUpViewController
        self.show(vc, sender: nil)
    }
}
