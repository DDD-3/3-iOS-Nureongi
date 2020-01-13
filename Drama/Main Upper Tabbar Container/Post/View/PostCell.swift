//
//  PostCellTableViewCell.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/26.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import SnapKit

class PostCell: BaseTableViewCell {
    
    //MARK: - Views Start
    var cardView: UIView = {
       let cardView = UIView()
       cardView.backgroundColor = .cardCellBackgroundColor
       cardView.layer.cornerRadius = 6
       return cardView
    }()
    
    var profileImg: UIImageView = {
       let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
       imgView.layer.cornerRadius = 17
       imgView.backgroundColor = .systemPurple
       return imgView
    }()
    
    var userName: UILabel = {
       let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 15)
        lbl.text = "익명"
        lbl.textColor = .white
       return lbl
    }()
    
    var date: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 13)
        lbl.text = "2020.01.12 17:23"
        lbl.textColor = .textGrayColor
        return lbl
    }()
    
    var postImg: UIImageView = {
        let postImg = UIImageView()
        postImg.contentMode = .scaleAspectFill
        postImg.clipsToBounds = true
        return postImg
    }()
    
    var postingSentence: UILabel = {
       let posting = UILabel()
       posting.font = .systemFont(ofSize: 13)
       posting.text = "아 이번화 진짜 재밌지 않았나요 특히 이 장면에서 일명이가 명이아 이번화 진짜 재밌지 않았나요 특히 이 장면 에서 일명이가이명이아 이번화 진짜 재밌지 않았나요 특히 이 장면에서  이…"
       posting.numberOfLines = 3
       posting.textColor = .textGrayColor
       posting.lineBreakMode = .byTruncatingTail
       return posting
    }()
    
    //MARK: - Initailizer
    override func setupViews() {
        
        backgroundColor = .black
        //postImg.image = UIImage(named: "동백꽃.jpeg")
        
        autoLayoutSetup()
    }
}


//MARK: - UI AutoLayout
extension PostCell {
    private func autoLayoutSetup() {
        self.addSubview(cardView)
        cardView.addSubview(profileImg)
        cardView.addSubview(userName)
        cardView.addSubview(date)
        
        cardView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading).offset(12)
            make.trailing.equalTo(self.snp.trailing).offset(-12)
            make.bottom.equalTo(self.snp.bottom).offset(-18)
            //make.height.equalTo(500)
        }
        
        
        profileImg.snp.makeConstraints { (make) in
            make.leading.equalTo(cardView.snp.leading).offset(14)
            make.top.equalTo(cardView.snp.top).offset(15)
            make.width.equalTo(34)
            make.height.equalTo(34)
        }

        userName.snp.makeConstraints { (make) in
            make.top.equalTo(self.profileImg.snp.top)
            make.leading.equalTo(self.profileImg.snp.trailing).offset(10)
        }

        date.snp.makeConstraints { (make) in
            make.top.equalTo(self.userName.snp.bottom)
            make.leading.equalTo(self.userName.snp.leading)
        }

        if postImg.image != nil {
            cardView.addSubview(postImg)

            postImg.snp.makeConstraints { (make) in
                make.top.equalTo(profileImg.snp.bottom).offset(12)
                make.leading.equalTo(cardView.snp.leading)
                make.trailing.equalTo(cardView.snp.trailing)
                make.height.equalTo( ((self.bounds.size.width - 24) * 135) / 351 )
            }
            cardView.addSubview(postingSentence)
            
            postingSentence.snp.makeConstraints { (make) in
                make.top.equalTo(postImg.snp.bottom).offset(11)
                make.leading.equalTo(cardView.snp.leading).offset(12)
                make.trailing.equalTo(cardView.snp.trailing).offset(-12)
                make.bottom.equalTo(cardView.snp.bottom).offset(-48)
            }
        } else {
            cardView.addSubview(postingSentence)
            
            postingSentence.snp.makeConstraints { (make) in
                make.top.equalTo(profileImg.snp.bottom).offset(13)
                make.leading.equalTo(cardView.snp.leading).offset(12)
                make.trailing.equalTo(cardView.snp.trailing).offset(-12)
                make.bottom.equalTo(cardView.snp.bottom).offset(-48)
            }
        }
    }
}
