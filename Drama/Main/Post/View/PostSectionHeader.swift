//
//  PostSectionHeader.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/28.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import SnapKit

class PostSectionHeader: UITableViewHeaderFooterView {

    var backgroundCustomView : UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        return bgView
    }()
    
    var leftButton: DropDownButton = {
       let leftBtn = DropDownButton(array: ["전체","구독","북마크"])
       leftBtn.titleLabel?.font = .boldSystemFont(ofSize: 16)
       return leftBtn
    }()
    
    var rightButton: DropDownButton = {
        let rightBtn = DropDownButton(array: ["인기순","전체순","화제순"])
        rightBtn.titleLabel?.font = .boldSystemFont(ofSize: 12)
        return rightBtn
    }()
    
   
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(backgroundCustomView)
        backgroundCustomView.addSubview(leftButton)
        backgroundCustomView.addSubview(rightButton)
        setupAutoLayout()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension PostSectionHeader {
    private func setupAutoLayout() {
        backgroundCustomView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        leftButton.snp.makeConstraints { (make) in
            make.top.equalTo(backgroundCustomView).offset(10)
            make.leading.equalTo(backgroundCustomView).offset(15)
            make.bottom.equalTo(backgroundCustomView).offset(-5)
            make.width.equalTo(70)
        }
        
        rightButton.snp.makeConstraints { (make) in
            make.top.equalTo(backgroundCustomView).offset(10)
            make.trailing.equalTo(backgroundCustomView).offset(-15)
            make.bottom.equalTo(backgroundCustomView).offset(-5)
            make.width.equalTo(70)
        }
    }
    
}
