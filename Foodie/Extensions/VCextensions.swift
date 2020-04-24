//
//  VCextensions.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/19/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension UIViewController{
    func alert(title: String) {
          
          let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
          let action = UIAlertAction(title: "OK", style: .default) { (action) in}
          alert.addAction(action)
          self.present(alert, animated: true, completion: nil)
          
      }
//    func alertStepper() {
//
//        let alert = UIAlertController(title: "Add Data To Cart First ", message: "", preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default) { (action) in}
//        alert.addAction(action)
//        self.present(alert, animated: true, completion: nil)
//
//    }
    func instantiateSignInVC(){
    let sb = UIStoryboard(name: "Main", bundle: nil)
           let closeVC = sb.instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
           self.present(closeVC ,animated: true, completion: nil)
    }
    
    func instantiateSignUpVC(){
      let sb = UIStoryboard(name: "Main", bundle: nil)
             let signUpVC = sb.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
             self.present(signUpVC ,animated: true, completion: nil)
      }
}
extension UIView {
    func roundedCorner(radius: CGFloat) {
           self.layer.cornerRadius = radius
           self.layer.masksToBounds = true
       }
       
       func dropShadow() {
           self.layer.shadowColor = UIColor.black.cgColor
           self.layer.shadowRadius = 10.0
           self.layer.masksToBounds = false
           self.layer.shadowOffset = CGSize(width: 8.0, height: 10.0)
           self.layer.shadowOpacity = 0.8
           self.clipsToBounds = false
       }
}
