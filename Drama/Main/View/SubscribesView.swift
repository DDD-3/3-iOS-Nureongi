//
//  SubscribesView.swift
//  Drama
//
//  Created by 정기욱 on 2020/01/08.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import UIKit

class SubscribesView: UIView {
    
    let subscribeCellId = "subscribeCellId"
    var imgArr = (1...6).map{UIImage.init(named: "\($0)")}
    
    var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cView.isPagingEnabled = true
        cView.backgroundColor = .white
        return cView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(SubscribeCell.self, forCellWithReuseIdentifier: subscribeCellId)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension SubscribesView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: subscribeCellId, for: indexPath) as! SubscribeCell
//        cell.imageView.image = imgArr[indexPath.row]
//        cell.backgroundColor = .lightGray
//        cell.layer.cornerRadius = 74/2
//        cell.imageView.contentMode = .scaleToFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: 74, height: 74)
    }

}

class SubscribeCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
     
     required init?(coder: NSCoder) {
         fatalError()
     }
}

