//
//  SignUpViewController.swift
//  Tasheel
//
//  Created by Abed Nayef Qasim on 8/4/19.
//  Copyright © 2019 Abed Nayef Qasim. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var errors = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        emailTextField.delegate = self
        nameTextField.delegate = self
        emailTextField.addBorder()
        passwordTextField.addBorder()
        nameTextField.addBorder()
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func showHome() {
        let vc = Helper.initViewControllerWith(identifier: "HomeNavigationController", and: "") 
        self.show(vc, sender: nil)
    }
    @IBAction func SignUp(_ sender: Any) {
        if (!validation()){
            alert(message: errors)
            return
        }
        AuthService.signUp(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, onSuccess: {
            self.alert(message: "Register Successfully", title: "")
            self.showHome()
        }) { (error) in
            self.alert(message: error ?? "", title: "")
        }
    }
    
    func validation()->Bool {
        errors = ""
        if let name = nameTextField.text , name.isEmpty {
            errors.append(contentsOf: "Name shouldn't be empty")
            errors.append("\n")
        }
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
