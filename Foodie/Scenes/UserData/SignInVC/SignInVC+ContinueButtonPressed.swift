//
//  SignInVC+ContinueButtonPressed.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/19/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension SignInVC {
    
    func signInButtonPressed(){
        guard let email = emailTextfield.text, !email.isEmpty else {return alert()}
               guard let password = passwordTextfield.text, !password.isEmpty else {return alert()}
               
               let sb = UIStoryboard(name: "Main", bundle: nil)
               let mallVC = sb.instantiateViewController(withIdentifier: "UINavigationController") as! UINavigationController
               
//                SignInUserDefaultsManager.shared().isSignInLogged = true
               if emailTextfield.text == user.email && passwordTextfield.text == user.password {
                     SignInUserDefaultsManager.shared().isSignInLogged = true
                      self.present(mallVC ,animated: true, completion: nil)
               }
               else {
                SignInUserDefaultsManager.shared().isSignInLogged = false
        }
    }
}
