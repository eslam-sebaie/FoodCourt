//
//  PopUpVC.swift
//  Foodie
//
//  Created by Eslam Sebaie on 4/22/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit

class PopUpVC: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var mealPriceLabel: UILabel!
    
    var popUpMealName:String!
    var popUpMealPrice:Int!
    override func viewDidLoad() {
    
       updateUI()
    }
        
    func updateUI() {
       popUpView.layer.cornerRadius = 12
       popUpView.layer.masksToBounds = true
      
       self.showAnimate()
       removePopUp()
    }
    func setMealName(){
         mealNameLabel.text = popUpMealName
    }
    func setMealPrice(){
        mealPriceLabel.text = "\(popUpMealPrice ?? 0) Pound"
    }
    func removePopUp(){
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(removeAnimate), userInfo: nil, repeats: false)
     }
   
   
   
    @IBAction func closePopUp(_ sender: Any) {
       self.removeAnimate()
    }
    
    func showAnimate()
      {
          self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
          self.view.alpha = 0.0;
          UIView.animate(withDuration: 0.25, animations: {
              self.view.alpha = 1.0
              self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
          });
     }
      
    @objc func removeAnimate()
      {
          UIView.animate(withDuration: 0.25, animations: {
              self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
              self.view.alpha = 0.0;
              }, completion:{(finished : Bool)  in
                  if (finished)
                  {
                      self.view.removeFromSuperview()
                  }
          });
      }


}
