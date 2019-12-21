//
//  PostViewController.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/21.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class PostViewController: UIViewController, IndicatorInfoProvider {
    
    let firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "안녕"
        return label
    }()
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "POST")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(firstLabel)
        
        firstLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        firstLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
}
