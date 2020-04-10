//
//  ProfileVC+EditFields.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/19/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension EditProfileViewController {
    
    func saveChangedData(){
         guard let name = addUserTextField.text, !name.isEmpty else { return }
                guard let email = addEmailTextField.text, !email.isEmpty else {return}
                guard let number = addPhoneNumber.text, !number.isEmpty else {return}
                guard let password = addPassTextField.text, !password.isEmpty else {return}
            
        //        presenter.deleteRealmData()
                    user.name = name
                    user.email = email
                    user.number = number
                    user.password = password
                    saveImage(image: profileImage.image ?? #imageLiteral(resourceName: "icons8-add-administrator-80"))
                    presenter.saveRealmData(user: user)
                   
                    
                        let alert = UIAlertController(title: "Saved", message: "", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Done", style: .default) { (action) in}
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                        
                        
                      
    }
}
