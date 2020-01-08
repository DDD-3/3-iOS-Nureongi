//
//  MainViewController.swift
//  Drama
//
//  Created by joon-ho kil on 2019/12/28.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrView = UIScrollView()
        scrView.layer.cornerRadius = 18
        scrView.contentSize = self.contentView.bounds.size
        return scrView
    }()
    
    var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    var thumbnail: ThumnailPosterView = {
        let nail = ThumnailPosterView()
        return nail
    }()
    
    var subscribesView: SubscribesView = {
        let subscribeView = SubscribesView()
        return subscribeView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewsAndAutoLayout()
    }
}


//MARK:- AutoLayout
extension MainViewController {
    
    private func addSubviewsAndAutoLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(thumbnail)
        contentView.addSubview(subscribesView)
        
        scrollView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.bounds.width)
            make.height.equalTo(1000)
        }
        
        thumbnail.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top).offset(26)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.height.equalTo(200)
        }
        
        subscribesView.snp.makeConstraints { (make) in
            make.top.equalTo(thumbnail.snp.bottom).offset(28)
            make.left.equalTo(thumbnail.snp.left)
            make.right.equalTo(thumbnail.snp.right)
            make.height.equalTo(300)
        }
        
    }
}
