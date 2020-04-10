//
//  ReciptVC+CollectioView.swift
//  Foodie
//
//  Created by Eslam Sebaie on 4/10/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension ReciptVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return data[section].subType.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! dataCollectionViewCell
       
        
        cell.detailName.text = data[indexPath.section].subType[indexPath.item]
        cell.secindex = indexPath.section
        cell.tagButton = indexPath.row
        cell.select = indexPath
        cell.layer.cornerRadius = 15
        
        cell.delegate = self
        cell.isSelected = false
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as!
             dataCollectionViewCell

        cell.isSelected = true
        item = data[indexPath.section].subType[indexPath.row]
        for i in 0...9 {
            if i == indexPath.section {
                dataDic.append(element: item , toValueOfKey: String(indexPath.section))
                break
            }
        }
        
    }

  
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
           case UICollectionView.elementKindSectionHeader:
           
               let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as! sectionHeader
           headerview.question = data[indexPath.section].headerName
       
         
         headerview.backgroundColor = UIColor.clear
         return headerview

     case UICollectionView.elementKindSectionFooter:
         let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath)

         footerView.backgroundColor = UIColor.clear
         return footerView

     default:

         assert(false, "Unexpected element kind")
     }
       }
       
       func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           sizeForItemAt indexPath: IndexPath) -> CGSize {
           
         return CGSize(width: 100, height: 50)
       }
       

}
