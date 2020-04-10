//
//  RegisterVC+Validation.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/19/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension SignUpVC {
    
   func isValidEmail(_ email: String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z.]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       if emailPred.evaluate(with: email) {
           return true
       }
           
       else {
           
           checkEmailLabel.isHidden = false
           emailText.layer.borderColor = UIColor.red.cgColor
           return false
       }
   }
   func isPasswordValid(_ password : String) -> Bool{
       let passRegEx = "^(?=.*[A-Z])(?=.*[!@#$_&*])(?=.*[0-9])(?=.*[a-z]).{8,}$"
       let passwordTest = NSPredicate(format: "SELF MATCHES %@",passRegEx)
       if passwordTest.evaluate(with: password){
           return true
       }
       else {
           checkPassLabel.isHidden = false
           passwordText.layer.borderColor = UIColor.red.cgColor
           return false
       }
   }
   
    func validate() -> Bool {
       if let name = nameText.text, !name.isEmpty ,let email = emailText.text, email != "", let number = phoneText.text, number != "" , let password = passwordText.text,!password.isEmpty
       {
           return true
       }
       return false
   }
}
