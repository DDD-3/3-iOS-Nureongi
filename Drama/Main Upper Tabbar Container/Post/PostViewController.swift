//
//  PostViewController.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/21.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SnapKit

class PostViewController: UIViewController, IndicatorInfoProvider {
    
    let postCellID = "postCell"
    
    
     //MARK: - Views Start
    var tableView : UITableView = {
       let tableView = UITableView()
       tableView.backgroundColor = .black
       return tableView
    }()
    
    var sectionHeaderRemoved: Bool = false
    
    var sectionHeader : UIView = {
        let sectionHeader = UIView()
        sectionHeader.backgroundColor = .black
        sectionHeader.translatesAutoresizingMaskIntoConstraints = false
        return sectionHeader
    }()
    
    var leftButton: DropDownButton = {
          let leftBtn = DropDownButton(array: ["전체","구독","북마크"])
          leftBtn.titleLabel?.font = .boldSystemFont(ofSize: 15)
          leftBtn.setTitleColor(.white, for: .normal)
          return leftBtn
    }()
    
    var rightButton: DropDownButton = {
        let rightBtn = DropDownButton(array: ["인기순","전체순","화제순"])
        rightBtn.titleLabel?.font = .boldSystemFont(ofSize: 15)
        rightBtn.setTitleColor(.white, for: .normal)
        return rightBtn
    }()
    
    
    

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostCell.self, forCellReuseIdentifier: postCellID)
        
        setupTableView()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "POST")
    }
    
}

//MARK: - CollectionView DataSource & Delegate

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postCellID, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    


    // Section Header 스크롤때마다 나타나고 사라지고 구현
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let y = targetContentOffset.pointee.y

        if y > 0, sectionHeaderRemoved == false {
            sectionRemove()
        } else if y == 0, sectionHeaderRemoved == true {
            sectionRelease()
        }
    }
    
}


//MARK: - UI AutoLayout

extension PostViewController {
    private func setupTableView() {
        
        view.addSubview(tableView)
        view.addSubview(sectionHeader)
        sectionHeader.addSubview(leftButton)
        sectionHeader.addSubview(rightButton)
        
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
        
        setupLeftRightDropDownButton()
    }
    
    private func setupLeftRightDropDownButton() {
        leftButton.snp.makeConstraints { (make) in
            make.top.equalTo(sectionHeader.snp.top).offset(10)
            make.leading.equalTo(sectionHeader.snp.leading).offset(15)
            make.bottom.equalTo(sectionHeader.snp.bottom).offset(-5)
            make.width.equalTo(70)
               }
               
        rightButton.snp.makeConstraints { (make) in
            make.top.equalTo(sectionHeader.snp.top).offset(10)
            make.trailing.equalTo(sectionHeader.snp.trailing).offset(-15)
            make.bottom.equalTo(sectionHeader.snp.bottom).offset(-5)
            make.width.equalTo(70)
        }
    }
    
    private func sectionRemove() {
        sectionHeaderRemoved = true
        sectionHeader.isHidden = true
        
        rightButton.dismissDropDown()
        leftButton.dismissDropDown()
        
        rightButton.snp.removeConstraints()
        leftButton.snp.removeConstraints()
        
        sectionHeader.snp.updateConstraints { (make) in
            make.height.equalTo(0)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func sectionRelease() {
        sectionHeaderRemoved = false
        sectionHeader.isHidden = false
        
        sectionHeader.snp.updateConstraints { (make) in
            make.height.equalTo(50)
        }
        
        setupLeftRightDropDownButton()
    }
}
