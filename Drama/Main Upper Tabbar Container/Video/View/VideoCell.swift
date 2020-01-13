//
//  VideoCellTableViewCell.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/29.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import SnapKit

class VideoCell: BaseTableViewCell {

    //MARK: - Views Start
    var imgView: UIImageView = {
       let imgView = UIImageView()
       let img = UIImage(named: "드라마.jpeg")
       imgView.image = img
       imgView.contentMode = .scaleAspectFill
       imgView.clipsToBounds = true
       return imgView
    }()
    
    var title: UILabel = {
        let title = UILabel()
        title.text = "드라마 제목인데 무슨 드라마일까요. 드라마 제목 드라마 제목"
        title.numberOfLines = 0
        title.textColor = .white
        title.font = .boldSystemFont(ofSize: 14)
        return title
    }()
    
    var owner: UILabel = {
        let owner = UILabel()
        owner.text = "드라마작가. \n조회수 10만회. 5일전"
        owner.textColor = .lightGray
        owner.numberOfLines = 2
        owner.font = .systemFont(ofSize: 12)
        return owner
    }()
    
     //MARK: - Setup Views
    override func setupViews() {
        setupAutoLayout()
    }
}






//MARK: - UI AutoLayout
extension VideoCell {
    private func setupAutoLayout() {
        
        backgroundColor = .black
        selectionStyle = .none
        addSubview(imgView)
        addSubview(title)
        addSubview(owner)
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(5)
            make.leading.equalTo(self.snp.leading).offset(5)
            //make.trailing.equalTo(self.snp.trailing).offset(-15)
            make.bottom.lessThanOrEqualTo(self.snp.bottom).offset(-5)
            make.width.equalTo(self.snp.width).dividedBy(2.4)
        }
        
        title.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.top)
            make.leading.equalTo(imgView.snp.trailing).offset(15)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
        }
        
        owner.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.leading.equalTo(title.snp.leading)
            
        }
    }
}
