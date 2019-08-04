//
//  AuthService.swift
//  InstagramClone
//
//  Created by The Zero2Launch Team on 12/17/16.
//  Copyright © 2016 The Zero2Launch Team. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
class AuthService {
    
    static func signIn(email: String, password: String, onSuccess: @escaping () -> Void, onError:  @escaping (_ errorMessage: String?) -> Void) {
        Helper.showProgress()
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            Helper.dismissProgress()
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            onSuccess()
        })
        
    }
    
    static func signUp(name: String, email: String, password: String, onSuccess: @escaping () -> Void, onError:  @escaping (_ errorMessage: String?) -> Void) {
        Helper.showProgress()

        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            Helper.dismissProgress()

            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            let uid = user?.user.uid
            self.setUserInfomation(name: name, email: email, uid: uid!, onSuccess: onSuccess)
        }
    }
    
    static func setUserInfomation(name: String, email: String, uid: String, onSuccess: @escaping () -> Void) {
        let ref = Database.database().reference()
        let usersReference = ref.child("users")
        let newUserReference = usersReference.child(uid)
        newUserReference.setValue(["email": email,"name":name])
        onSuccess()
    }
    static func logout(onSuccess: @escaping () -> Void, onError:  @escaping (_ errorMessage: String?) -> Void) {
        do {
            try Auth.auth().signOut()
            onSuccess()
        } catch let logoutError {
            onError(logoutError.localizedDescription)
        }
    }
    static var CURRENT_USER: User? {
        if let currentUser = Auth.auth().currentUser {
            return currentUser
        }
        
        return nil
    }
    
}
