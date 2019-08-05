//
//  LoginViewController.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/4/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var errors = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.addBorder()
        passwordTextField.addBorder()
    }
    @IBAction func SignUp(_ sender: Any) {
        let vc = Helper.initViewControllerWith(identifier: "SignUpViewController", and: "") as! SignUpViewController
        self.show(vc, sender: nil)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Login(_ sender: Any) {
        if (!validation()){
            alert(message: errors)
            return
        }
        AuthService.signIn(email: emailTextField.text!, password: passwordTextField.text!, onSuccess: {
            self.showHome()
        }) { (error) in
            self.alert(message: error ?? "", title: "")
        }
    }
    func showHome() {
        let vc = Helper.initViewControllerWith(identifier: "HomeNavigationController", and: "") 
        self.show(vc, sender: nil)
    }
    func validation()->Bool {
        errors = ""
        if let email = emailTextField.text , email.isEmpty {
            errors.append(contentsOf: "Email shouldn't be empty")
            errors.append("\n")
        }
        if let password = passwordTextField.text , password.isEmpty {
            errors.append(contentsOf: "Password shouldn't be empty")
            errors.append("\n")
        }
        return errors.isEmpty
    }
    
    
    
    
}
