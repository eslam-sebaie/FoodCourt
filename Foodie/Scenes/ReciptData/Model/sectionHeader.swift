//
//  sectionHeader.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/28/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit

class sectionHeader: UICollectionReusableView {
    
    
    @IBOutlet weak var headerLabel: UILabel!

    
    var question: String! {
        didSet {
            headerLabel.text = question
        }
    }
}
