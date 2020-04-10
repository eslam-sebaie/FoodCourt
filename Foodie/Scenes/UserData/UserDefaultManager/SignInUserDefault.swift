//
//  SignInUserDefaultManager.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/19/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import Foundation
class SignInUserDefaultsManager {
    
   private static let sharedInstance = SignInUserDefaultsManager()
    
    static func shared() -> SignInUserDefaultsManager {
    
        return SignInUserDefaultsManager.sharedInstance
    }
    
    var isSignInLogged: Bool  {
        
        set {
            
            UserDefaults.standard.set(newValue, forKey: userDefaultKeys.isSignInLogged)
            SignInUserDefaultsManager.setData(val: newValue)
        }
        get {
            
            return UserDefaults.standard.bool(forKey: userDefaultKeys.isSignInLogged)
        }
        
    }
    static func setData(val: Bool) {
    
        let users = SignIn(isSigninLogged: val)
          
            let encoder = JSONEncoder()
            guard let encoded = try? encoder.encode(users) else {return}
            UserDefaults.standard.set(encoded, forKey: userDefaultKeys.isSignInLogged)
    
        }
    static func readData() -> SignIn {
     
             let decoder = JSONDecoder()
             let savedUser = (UserDefaults.standard.object(forKey: "SignInusers") as? Data)!
             let storedData = try? decoder.decode(SignIn.self, from: savedUser)
             return storedData!
         }

}
