//
//  RegisterViewController.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 2/1/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import RealmSwift
class SignUpVC: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var registerChange: UIButton!
    @IBOutlet weak var checkEmailLabel: UILabel!
    @IBOutlet weak var checkPassLabel: UILabel!
    
    let realm = try! Realm()
    let user = UserData()
    var presenter = userPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        
        registerChange.layer.cornerRadius = 24
        registerChange.layer.masksToBounds = true
        checkPassLabel.isHidden = true
        checkEmailLabel.isHidden = true
    }
    
    @IBAction func registerButton(_ sender: Any) {
        signUpPressed()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
       instantiateSignInVC()
    }
    
}
