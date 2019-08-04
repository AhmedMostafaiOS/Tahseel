//
//  ViewController.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/4/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    var destinationStoryboard = "ChooseViewController"
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4  , execute:{
            if let _ = AuthService.CURRENT_USER {
                self.destinationStoryboard = "HomeNavigationController"
            }
            self.nextScreen()
       })
    }
    func nextScreen()  {
        let vc = Helper.initViewControllerWith(identifier: self.destinationStoryboard, and: "")
        self.show(vc, sender: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(true, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    


}

