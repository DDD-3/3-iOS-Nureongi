//
//  ThumbnailPosterView.swift
//  Drama
//
//  Created by 정기욱 on 2020/01/08.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import UIKit

class ThumnailPosterView: UIView {
    
    let imageViewCellId = "imageViewCellId"
    var imgArr = (1...6).map{UIImage.init(named: "\($0)")}
    var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cView.isPagingEnabled = true
        return cView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(imageViewCell.self, forCellWithReuseIdentifier: imageViewCellId)
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

extension ThumnailPosterView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageViewCellId, for: indexPath) as! imageViewCell
        cell.imageView.image = imgArr[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

class imageViewCell: UICollectionViewCell {
    
    var imageView : UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
     
     required init?(coder: NSCoder) {
         fatalError()
     }
}
