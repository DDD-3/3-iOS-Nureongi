//
//  HomeMainTableViewCell.swift
//  Drama
//
//  Created by joon-ho kil on 2020/01/03.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import UIKit

class HomeMainTableViewCell: UITableViewCell {
    static let ID = "HomeMainTableViewCell"
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        
        return imageView
    }()
    
    let circleImageView: UIView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(25)
        label.text = "굿와이프"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.text = "tvN 2016년 7월 8일 ~ 2016년 8월 27일"
        
        return label
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("FOLLOW", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(10)
        button.backgroundColor = UIColor.systemGray
        return button
    }()
//
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        viewArrangement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func viewArrangement() {
        self.addSubview(posterImageView)
        self.addSubview(circleImageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(followButton)
        
        posterImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide).offset(0)
            make.height.equalTo(posterImageView.snp.width).multipliedBy(1.0/2.0)
        }
        circleImageView.snp.makeConstraints { make in
            make.bottom.equalTo(posterImageView.snp.bottom).offset(30)
            make.leading.equalTo(posterImageView.snp.trailing).multipliedBy(1.0/8.0)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(50)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(20)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
        }
        followButton.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(10)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(30)
            make.width.equalTo(60)
        }
    }
}
