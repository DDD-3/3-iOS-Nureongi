//
//  BasicInfoTableViewCell.swift
//  Drama
//
//  Created by joon-ho kil on 2020/01/04.
//  Copyright © 2020 joon-ho kil. All rights reserved.
//

import UIKit

class BasicInfoTableViewCell: UITableViewCell {
    static let ID = "BasicInfoTableViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(25)
        label.text = "기본정보"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.text = "승승장구하던 검사 남편이 정치 스캔들과 부정부패로 구속되자 결혼 이후 일을 그만두었던 아내가 가정의 생계를 책임지기 위해 변호사로 복귀한다."
        label.numberOfLines = 3
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
        self.addSubview(descriptionLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(20)
            make.leading.trailing.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(20)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
        }
    }
}
