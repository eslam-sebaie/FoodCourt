//
//  SignupVc+SetData.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/19/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension SignUpVC {
    
    func setData(){
       
           user.name = nameText.text!
           user.email = emailText.text!
           user.number = phoneText.text!
           user.password = passwordText.text!
           presenter.saveRealmData(user: user)

       }
}
