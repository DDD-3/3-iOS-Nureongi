//
//  PostCellTableViewCell.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/26.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import SnapKit

class PostCell: UITableViewCell {
    
    //TODO:  CollectionView 로 바꿔야함
    var thumbnail: UIImageView = {
       let imageView = UIImageView()
       imageView.image = UIImage(named: "동백꽃")
       //imageView.contentMode = .scaleToFill
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likeButton, pageController, postButton])
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    var likeButton: UIButton = {
        let likeBtn = UIButton()
        likeBtn.backgroundColor = .red
        return likeBtn
    }()
    
    //TODO: Collection View와 연동
    var pageController: UIPageControl = {
       let pageCount = UIPageControl()
        pageCount.currentPage = 0
        pageCount.currentPageIndicatorTintColor = .red
        pageCount.pageIndicatorTintColor = .gray
        pageCount.numberOfPages = 3
        return pageCount
    }()
    
    var postButton: UIButton = {
      let postBtn = UIButton()
      postBtn.backgroundColor = .darkGray
      return postBtn
    }()
    
    var descriptionLabel: UILabel = {
       let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.text = "동백꽃 필 무렵"
       return lbl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(thumbnail)
        self.addSubview(stackView)
        self.addSubview(descriptionLabel)
        
        autoLayoutSetup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}



//MARK: - UI AutoLayout
extension PostCell {
    private func autoLayoutSetup() {
        thumbnail.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview().offset(15)
            make.width.equalTo(self.snp.width).offset(-30)
            make.height.equalTo(150)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(thumbnail.snp.bottom).offset(20)
            make.leading.equalTo(self.snp.leading).offset(15)
            make.trailing.equalTo(self.snp.trailing).offset(-15)
        }
        
        postButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(40)
        }
        
        likeButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(40)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading).offset(15)
            make.top.equalTo(stackView.snp.bottom).offset(10)
        }
    }
}
