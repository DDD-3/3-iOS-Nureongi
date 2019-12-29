//
//  VideoCellTableViewCell.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/29.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import SnapKit

class VideoCell: UITableViewCell {

    var imgView: UIImageView = {
       let imgView = UIImageView()
       let img = UIImage(named: "동백꽃.jpeg")
       imgView.image = img
       imgView.contentMode = .scaleAspectFit
       return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imgView)
        setupAutoLayout()
        imgView.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init 에러")
    }
}

//MARK: - UI AutoLayout
extension VideoCell {
    private func setupAutoLayout() {
        imgView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(15)
            make.leading.equalTo(self.snp.leading).offset(15)
            //make.trailing.equalTo(self.snp.trailing).offset(-15)
            make.bottom.equalTo(self.snp.bottom).offset(-15)
            make.width.equalTo(self.snp.width).dividedBy(2.5)
        }
    }
}
