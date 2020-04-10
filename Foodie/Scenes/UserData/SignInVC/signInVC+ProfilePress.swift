//
//  signInVC+ProfilePress.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/19/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension SignInVC {
    func editProfilePressed(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let EditVC = sb.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController

            if emailTextfield.text == user.email && passwordTextfield.text == user.password {
                 EditVC.editPic = getSavedImage(named: "fileName")
                 self.present(EditVC ,animated: true, completion: nil)
            }
         else {
            enterDataLabel.isHidden = false
        }
    }
}
