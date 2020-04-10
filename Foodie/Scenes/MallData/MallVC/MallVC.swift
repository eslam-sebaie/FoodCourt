//
//  MallViewController.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 2/28/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import CLTypingLabel
import FirebaseFirestore
class MallVC: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var activityView: UIView!
   
    var myMalldata: mallData = mallData(name: [], image: [])
    var mallString: String = ""

    var presenter: MallPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        //setSpecialData()
        presenter = MallPresenter(view: self)
        presenter.readData()
        updateUI()
        
        
    }
   
  
    func updateUI() {
        
        tableView.rowHeight = 250
        activityView.alpha = 0.8
        activityView.layer.cornerRadius = 20.0
        activityView.layer.masksToBounds = true
        tableView.backgroundView = UIImageView(image: UIImage(named: "mallBack"))
    }
    
}

