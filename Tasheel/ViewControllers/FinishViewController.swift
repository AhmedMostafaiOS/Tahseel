//
//  FinishViewController.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/6/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(true, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    @IBAction func BackHome(_ sender: Any) {
        let vc = Helper.initViewControllerWith(identifier: "HomeViewController", and: "") as! HomeViewController
        show(vc, sender: nil)
    }
    
}
