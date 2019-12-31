//
//  HotDataSource.swift
//  Drama
//
//  Created by joon-ho kil on 2019/12/29.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit

class HotDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hotCell", for: indexPath)
        
        return cell
    }
}
