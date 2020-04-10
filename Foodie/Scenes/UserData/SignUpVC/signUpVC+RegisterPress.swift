//
//  signUpVC+RegisterPress.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/19/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension SignUpVC {
    
    func signUpPressed(){
        if validate(){
                   if isValidEmail(emailText.text!) {
                       checkEmailLabel.isHidden = true
//                       emailText.layer.borderColor = UIColor.clear.cgColor
                       if isPasswordValid(passwordText.text!) {
                           checkPassLabel.isHidden = true
//                           passwordText.layer.borderColor = UIColor.clear.cgColor
                          setData()
                          
                           SignUpUserDefaultsManager.shared().isSignUpLogged = true
                           SignInUserDefaultsManager.shared().isSignInLogged = false
                           instantiateSignInVC()
                    
                       }
                   }
               }
               else if !validate() {
                   alert()
               }
    }
}
