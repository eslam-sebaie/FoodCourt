//
//  ResturantVC+CollectionView.swift
//  iCarsousel
//
//  Created by Eslam Sebaie on 3/22/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension ResturantVC: UICollectionViewDataSource, UICollectionViewDelegate {

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return newArr.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NameCollectionViewCell
            cell.labelName.text = newNameArr[indexPath.row]
            cell.layer.cornerRadius = 20
            cell.layer.masksToBounds = true
            cell.isSelected = false
          
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         
            print("eslam")
             newIndex = indexPath.row
             indx = indexPath
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NameCollectionViewCell
            cell.isSelected = true
            allPressChanged.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            allPressChanged.tintColor = UIColor.black
            checkCarousel = true
            iCarouselView.reloadData()


            
    }
}
