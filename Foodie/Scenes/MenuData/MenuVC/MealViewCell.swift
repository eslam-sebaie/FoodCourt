//
//  MealViewCell.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 2/28/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit

class MealViewCell: UITableViewCell {

    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        upperView.layer.cornerRadius = 15.0
        upperView.layer.masksToBounds = true
        upperView.alpha = 0.8
        mealImage.backgroundColor = UIColor.black
        mealImage.layer.cornerRadius = 10.0
        mealImage.layer.masksToBounds = true
    }

}
