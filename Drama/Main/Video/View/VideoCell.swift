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
       let img = UIImage(named: "드라마.jpeg")
       imgView.image = img
       imgView.contentMode = .scaleToFill
       return imgView
    }()
    
    var title: UILabel = {
        let title = UILabel()
        title.text = "드라마 제목인데 무슨 드라마일까요"
        title.numberOfLines = 0
        title.font = .boldSystemFont(ofSize: 13)
        return title
    }()
    
    var owner: UILabel = {
        let owner = UILabel()
        owner.text = "드라마작가. 조회수 10만회. 5일전"
        owner.textColor = .lightGray
        owner.font = .systemFont(ofSize: 12)
        return owner
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imgView)
        addSubview(title)
        addSubview(owner)
        
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
            make.bottom.lessThanOrEqualTo(self.snp.bottom).offset(-15)
            make.width.equalTo(self.snp.width).dividedBy(2.3)
        }
        
        title.snp.makeConstraints { (make) in
            make.bottom.equalTo(imgView.snp.bottom).offset(-40)
            make.leading.equalTo(imgView.snp.trailing).offset(15)
            make.trailing.equalTo(self.snp.trailing).offset(-15)
        }
        
        owner.snp.makeConstraints { (make) in
            make.top.greaterThanOrEqualTo(title.snp.bottom).offset(10)
            make.leading.equalTo(title.snp.leading)
            make.bottom.equalTo(imgView.snp.bottom)
        }
    }
}
