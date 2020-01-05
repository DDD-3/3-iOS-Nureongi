//
//  CastTableViewCell.swift
//  Drama
//
//  Created by joon-ho kil on 2020/01/04.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import UIKit

class CastTableViewCell: UITableViewCell {
    static let ID = "CastTableViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(25)
        label.text = "출연진"
        return label
    }()
    let actor1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "actor1")
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let actor2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "actor2")
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let actor3ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "actor3")
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let actor4ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "actor4")
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let actor1CastLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.text = "김혜경"
        return label
    }()
    let actor1NameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(10)
        label.text = "전도연"
        return label
    }()
    let actor2CastLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.text = "이태준"
        return label
    }()
    let actor2NameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(10)
        label.text = "유지태"
        return label
    }()
    let actor3CastLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.text = "서중원"
        return label
    }()
    let actor3NameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(10)
        label.text = "윤계상"
        return label
    }()
    let actor4CastLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.text = "김단"
        return label
    }()
    let actor4NameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(10)
        label.text = "나나"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        viewArrangement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func viewArrangement() {
        self.addSubview(titleLabel)
        self.addSubview(actor1ImageView)
        self.addSubview(actor2ImageView)
        self.addSubview(actor3ImageView)
        self.addSubview(actor4ImageView)
        self.addSubview(actor1CastLabel)
        self.addSubview(actor2CastLabel)
        self.addSubview(actor3CastLabel)
        self.addSubview(actor4CastLabel)
        self.addSubview(actor1NameLabel)
        self.addSubview(actor2NameLabel)
        self.addSubview(actor3NameLabel)
        self.addSubview(actor4NameLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(20)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(20)
        }
        actor1ImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.height.width.equalTo(30)
        }
        actor1CastLabel.snp.makeConstraints { make in
            make.top.equalTo(actor1ImageView.snp.top)
            make.leading.equalTo(actor1ImageView.snp.trailing).offset(10)
            make.height.equalTo(15)
        }
        actor1NameLabel.snp.makeConstraints { make in
            make.top.equalTo(actor1CastLabel.snp.bottom)
            make.leading.equalTo(actor1ImageView.snp.trailing).offset(10)
            make.height.equalTo(15)
        }
        actor3ImageView.snp.makeConstraints { make in
            make.top.equalTo(actor1ImageView.snp.bottom).offset(20)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.height.width.equalTo(30)
        }
        actor3CastLabel.snp.makeConstraints { make in
            make.top.equalTo(actor3ImageView.snp.top)
            make.leading.equalTo(actor3ImageView.snp.trailing).offset(10)
            make.height.equalTo(15)
        }
        actor3NameLabel.snp.makeConstraints { make in
            make.top.equalTo(actor3CastLabel.snp.bottom)
            make.leading.equalTo(actor3ImageView.snp.trailing).offset(10)
            make.height.equalTo(15)
        }
        
        actor2ImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalTo(actor1CastLabel.snp.trailing).offset(20)
            make.height.width.equalTo(30)
        }
        actor2CastLabel.snp.makeConstraints { make in
            make.top.equalTo(actor2ImageView.snp.top)
            make.leading.equalTo(actor2ImageView.snp.trailing).offset(10)
            make.height.equalTo(15)
        }
        actor2NameLabel.snp.makeConstraints { make in
            make.top.equalTo(actor2CastLabel.snp.bottom)
            make.leading.equalTo(actor2ImageView.snp.trailing).offset(10)
            make.height.equalTo(15)
        }
        
        actor4ImageView.snp.makeConstraints { make in
            make.top.equalTo(actor2ImageView.snp.bottom).offset(20)
            make.leading.equalTo(actor3CastLabel.snp.trailing).offset(20)
            make.height.width.equalTo(30)
        }
        actor4CastLabel.snp.makeConstraints { make in
            make.top.equalTo(actor4ImageView.snp.top)
            make.leading.equalTo(actor4ImageView.snp.trailing).offset(10)
            make.height.equalTo(15)
        }
        actor4NameLabel.snp.makeConstraints { make in
            make.top.equalTo(actor4CastLabel.snp.bottom)
            make.leading.equalTo(actor4ImageView.snp.trailing).offset(10)
            make.height.equalTo(15)
        }
    }
}
