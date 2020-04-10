//
//  UserVCPresenter.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/19/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import RealmSwift
protocol userVCview: class {
    func fetchData(data: Results<personalInfo>)
}
class userPresenter {
    let realm = try! Realm()
       var userData: Results<personalInfo>?
    weak var delegate: userVCview?
    
    var interactor = RealmData()
    let newUser = personalInfo()
    
    init(view: userVCview) {
        self.delegate = view
    }
    init() {}
    
    func saveRealmData(user: UserData) {
        newUser.name = user.name
        newUser.email = user.email
        newUser.number = user.number
        newUser.password = user.password
        interactor.saveData(personal: newUser)
    }
    
    func readRealmData(){
        self.delegate?.fetchData(data: interactor.readData())
    }
    
//    func deleteRealmData(user: Results<personalInfo>) {
//           print("eslamsebaiesebaie")
//
//           interactor.deleteData(user: newUser)
//       }
    
 
}
