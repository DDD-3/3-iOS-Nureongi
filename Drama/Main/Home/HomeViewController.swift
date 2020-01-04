//
//  HomeViewController.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/21.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SnapKit

class HomeViewController: UIViewController, IndicatorInfoProvider {
    let infoTableView = UITableView(frame: CGRect.zero, style: .plain)
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "HOME")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(infoTableView)
        infoTableView.snp.makeConstraints { make in
           make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableViewSetup()
    }
    
    func tableViewSetup() {
        infoTableView.delegate = self
        infoTableView.dataSource = self
        infoTableView.register(HomeMainTableViewCell.self, forCellReuseIdentifier: HomeMainTableViewCell.ID)
        infoTableView.register(BasicInfoTableViewCell.self, forCellReuseIdentifier: BasicInfoTableViewCell.ID)
        infoTableView.register(CastTableViewCell.self, forCellReuseIdentifier: CastTableViewCell.ID)
        infoTableView.register(HotVideoTableViewCell.self, forCellReuseIdentifier: HotVideoTableViewCell.ID)
        infoTableView.allowsSelection = false
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeMainTableViewCell.ID, for: indexPath) as! HomeMainTableViewCell
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: BasicInfoTableViewCell.ID, for: indexPath) as! BasicInfoTableViewCell
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.ID, for: indexPath) as! CastTableViewCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HotVideoTableViewCell.ID, for: indexPath) as! HotVideoTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.bounds.width / 2.0 + 120
        }
        if indexPath.row == 1 {
            return 120
        }
        if indexPath.row == 2 {
            return 160
        }
        return CGFloat(158)
    }
}
