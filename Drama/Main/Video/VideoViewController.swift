//
//  VideoViewController.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/28.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SnapKit

class VideoViewController: UIViewController, IndicatorInfoProvider {

    var tableView = UITableView()
    
    var sectionHeader : UIView = {
        let sectionHeader = UIView()
        sectionHeader.backgroundColor = .white
        return sectionHeader
    }()
    
    var leftButton: DropDownButton = {
          let leftBtn = DropDownButton(array: ["인기순","추천순","구됵순"])
          leftBtn.titleLabel?.font = .boldSystemFont(ofSize: 15)
          leftBtn.setTitleColor(.black, for: .normal)
          return leftBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableView)
        self.view.addSubview(sectionHeader)
        sectionHeader.addSubview(leftButton)
        
        setupTableView()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "VIDEO")
    }


}

//MARK: - UI AutoLayout

extension VideoViewController {
    private func setupTableView() {
        sectionHeader.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalTo(self.tableView.snp.top)
            make.width.equalTo(self.view.safeAreaLayoutGuide.snp.width)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.sectionHeader.snp.bottom)
            make.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        leftButton.snp.makeConstraints { (make) in
            make.top.equalTo(sectionHeader.snp.top).offset(10)
            make.leading.equalTo(sectionHeader.snp.leading).offset(15)
            make.bottom.equalTo(sectionHeader.snp.bottom).offset(-5)
            make.width.equalTo(70)
        }
    }
}
