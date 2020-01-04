//
//  BaseCell.swift
//  Drama
//
//  Created by 정기욱 on 2020/01/01.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupViews() {
        
    }
}

class BaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         
       setupViews()
     }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupViews() {
        
    }
}
