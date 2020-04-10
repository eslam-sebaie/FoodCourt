//
//  ProfileVC+BindData.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/19/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension EditProfileViewController {
       
        func bindData(){
                   addUserTextField.text = user.name
                   addEmailTextField.text = user.email
                   addPhoneNumber.text = user.number
                   addPassTextField.text = user.password
                   profileImage.image = editPic
                   
                   
        }
}
