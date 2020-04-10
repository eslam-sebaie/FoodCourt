//
//  WelcomeViewController.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 2/1/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import CLTypingLabel
import RealmSwift

class SignInVC: UIViewController {
   

    @IBOutlet weak var enterDataLabel: UILabel!
    @IBOutlet weak var editProfileBut: UIButton!
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var buttonChange: UIButton!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    @IBOutlet weak var visualView: UIView!
    @IBOutlet weak var passVisualEffect: UIVisualEffectView!
    
    

    let user = UserData()
    var presenter: userPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = userPresenter(view: self)
        presenter.readRealmData()
        updateUI()
     

        
    }
    
    func updateUI() {
        visualEffect.layer.cornerRadius = 8
        visualEffect.layer.masksToBounds = true
        passVisualEffect.layer.cornerRadius = 8
        passVisualEffect.layer.masksToBounds = true
        enterDataLabel.isHidden = true
        buttonChange.layer.cornerRadius = 24
        buttonChange.layer.masksToBounds = true

    }
   
       
    @IBAction func continueBut(_ sender: Any) {
       signInButtonPressed()
    }
    

    
    @IBAction func editButton(_ sender: Any) {
        editProfilePressed()
    }
    
    
    func getSavedImage(named: String) -> UIImage? {
       
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        instantiateSignUpVC()
    }
}
