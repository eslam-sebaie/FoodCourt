//
//  UserDefault.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/19/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//
import Foundation
class SignUpUserDefaultsManager {
    
   private static let sharedInstance = SignUpUserDefaultsManager()
    
    static func shared() -> SignUpUserDefaultsManager {
    
        return SignUpUserDefaultsManager.sharedInstance
    }
    
    var isSignUpLogged: Bool  {
        
        set {
            
            UserDefaults.standard.set(newValue, forKey: userDefaultKeys.isSignUpLogged)
            SignUpUserDefaultsManager.setData(val: newValue)
        }
        get {
            
            return UserDefaults.standard.bool(forKey: userDefaultKeys.isSignUpLogged)
        }
        
    }
    static func setData(val: Bool) {
    
            let users = SignUp(isSignUpLogged: val)
          
            let encoder = JSONEncoder()
            guard let encoded = try? encoder.encode(users) else {return}
            UserDefaults.standard.set(encoded, forKey: userDefaultKeys.isSignUpLogged)
    
        }
    
      static func readData() -> SignUp {
    
            let decoder = JSONDecoder()
            let savedUser = (UserDefaults.standard.object(forKey: userDefaultKeys.isSignUpLogged) as? Data)!
             let storedData = try? decoder.decode(SignUp.self, from: savedUser)
            return storedData!
        }

}
