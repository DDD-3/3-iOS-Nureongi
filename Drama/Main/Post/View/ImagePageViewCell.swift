//
//  ImagePageViewCell.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/26.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import SnapKit

class ImagePageViewCell: UICollectionViewCell {
    
    //MARK: - Views Start
    var imgView: UIImageView = {
       let imgView = UIImageView()
       imgView.image = UIImage(named: "동백꽃.jpeg")
       imgView.contentMode = .scaleAspectFill
       imgView.clipsToBounds = true
       return imgView
    }()
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAutoLayout()
    }
     
     required init?(coder: NSCoder) {
         fatalError()
     }
}


//MARK: - UI AutoLayout
extension ImagePageViewCell {
    
    private func setupAutoLayout() {
        addSubview(imgView)
        
        imgView.snp.makeConstraints { (make) in
            make.top.trailing.leading.bottom.equalToSuperview()
        }
    }
}
