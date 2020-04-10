//
//  EditProfileViewController.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 2/2/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import RealmSwift
class EditProfileViewController: UIViewController {

    
    @IBOutlet weak var addUserTextField: UITextField!
    @IBOutlet weak var addEmailTextField: UITextField!
    @IBOutlet weak var addPhoneNumber: UITextField!
    @IBOutlet weak var addPassTextField: UITextField!
    @IBOutlet weak var saveBut: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
   
    var presenter: userPresenter! 
    var editPic: UIImage!
    
 
    var imagePicker = UIImagePickerController()
   
    let user = UserData()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        presenter = userPresenter(view: self)
        presenter.readRealmData()
        
        bindData()
       
      
        
    }

    func updateUI(){
        
        imagePicker.delegate = self
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        saveBut.layer.cornerRadius = 23
        saveBut.layer.masksToBounds = true
        
    }

    @IBAction func editFields(_ sender: UIButton) {
    
        if sender.tag == 1 {
            addUserTextField.text = ""
        }
        else if sender.tag == 2 {
            addEmailTextField.text = ""
        }
        else if sender.tag == 3 {
            addPhoneNumber.text = ""
        }
        else if sender.tag == 4 {
            addPassTextField.text = ""
        }
        
    }
    
    @IBAction func saveNewData(_ sender: Any) {
       saveChangedData()
    }
  
    func saveImage(image: UIImage) -> Bool {
        guard let data = image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("fileName.png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }

    
    
    @IBAction func backButton(_ sender: Any) {
      instantiateSignInVC()
    }
    
    @IBAction func onClickImagepicker(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
}


