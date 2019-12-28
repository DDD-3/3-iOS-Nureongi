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
 
    var imgView: UIImageView = {
       let imgView = UIImageView()
       imgView.image = UIImage(named: "동백꽃.jpeg")
       imgView.contentMode = .scaleAspectFill
       return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imgView)
        setupAutoLayout()
    }
     
     required init?(coder: NSCoder) {
         fatalError()
     }
}

extension ImagePageViewCell {
    
    private func setupAutoLayout() {
        imgView.snp.makeConstraints { (make) in
            make.top.trailing.leading.bottom.equalToSuperview()
        }
    }
}
