//
//  SubscribeDataSource.swift
//  Drama
//
//  Created by joon-ho kil on 2019/12/28.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit

class SubscribeDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subscribeCell", for: indexPath) as! SubscribeCell
        
        cell.posterImageView.contentMode = .scaleToFill
        cell.posterImageView.image = UIImage(named: "1")
        cell.posterImageView.layer.cornerRadius = 10 
        cell.title.text = "동백꽃 필무렵"
        
        return cell
    }
}
