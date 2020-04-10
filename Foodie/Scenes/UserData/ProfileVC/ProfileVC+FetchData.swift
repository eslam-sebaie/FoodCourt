//
//  ProfileVC+FetchData.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/19/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import RealmSwift
extension EditProfileViewController: userVCview {
    func fetchData(data: Results<personalInfo>) {
        for userData in data {
              print(userData.email)
              user.name = userData.name
              user.number = userData.number
              user.email = userData.email
              user.password = userData.password
        }
    }
    
    
}
