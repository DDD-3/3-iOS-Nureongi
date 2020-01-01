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
    
    let videoCellID = "videoCell"
    
    //MARK: - Views Start
    var tableView = UITableView()
    var sectionHeaderRemoved : Bool = false
    
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
    //MARK: - Views End
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(VideoCell.self, forCellReuseIdentifier: videoCellID)
        
        setupAutoLayout()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "VIDEO")
    }


}

//MARK: - UI AutoLayout

extension VideoViewController {
    private func setupAutoLayout() {
        
        self.view.addSubview(tableView)
        self.view.addSubview(sectionHeader)
        sectionHeader.addSubview(leftButton)
        
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
        
        setupLeftDropDownButton()
      
    }
    
    private func setupLeftDropDownButton() {
        leftButton.snp.makeConstraints { (make) in
            make.top.equalTo(sectionHeader.snp.top).offset(10)
            make.leading.equalTo(sectionHeader.snp.leading).offset(15)
            make.bottom.equalTo(sectionHeader.snp.bottom).offset(-5)
            make.width.equalTo(70)
        }
    }
}

//MARK: - TableView

extension VideoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: videoCellID, for: indexPath)
         
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // Section Header 스크롤때마다 나타나고 사라지고 구현
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let y = targetContentOffset.pointee.y

        if y > 0, sectionHeaderRemoved == false {
            sectionHeaderRemoved = true
            sectionHeader.isHidden = true
        
            leftButton.dismissDropDown()
            leftButton.snp.removeConstraints()
            
            sectionHeader.snp.updateConstraints { (make) in
                make.height.equalTo(0)
            }
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        } else if y == 0, sectionHeaderRemoved == true {
            sectionHeaderRemoved = false
            sectionHeader.isHidden = false
            
            sectionHeader.snp.updateConstraints { (make) in
                make.height.equalTo(50)
            }
            
            setupLeftDropDownButton()
        }
        
        
    }
}
