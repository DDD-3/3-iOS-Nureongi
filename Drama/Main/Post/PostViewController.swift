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
    
    var tableView = UITableView()
    var sectionHeaderRemoved: Bool = false
    
    var sectionHeader : UIView = {
        let sectionHeader = UIView()
        sectionHeader.backgroundColor = .white
        sectionHeader.translatesAutoresizingMaskIntoConstraints = false
        return sectionHeader
    }()
    
    var leftButton: DropDownButton = {
          let leftBtn = DropDownButton(array: ["전체","구독","북마크"])
          leftBtn.titleLabel?.font = .boldSystemFont(ofSize: 15)
          leftBtn.setTitleColor(.black, for: .normal)
          return leftBtn
    }()
    
    var rightButton: DropDownButton = {
        let rightBtn = DropDownButton(array: ["인기순","전체순","화제순"])
        rightBtn.titleLabel?.font = .boldSystemFont(ofSize: 15)
        rightBtn.setTitleColor(.black, for: .normal)
        return rightBtn
    }()
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "POST")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostCell.self, forCellReuseIdentifier: postCellID)
        
        
        view.addSubview(tableView)
        view.addSubview(sectionHeader)
        sectionHeader.addSubview(leftButton)
        sectionHeader.addSubview(rightButton)
        
        setupTableView()
    }
    
}

//MARK: - UI AutoLayout

extension PostViewController {
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
        
    
        
        rightButton.snp.makeConstraints { (make) in
            make.top.equalTo(sectionHeader.snp.top).offset(10)
            make.trailing.equalTo(sectionHeader.snp.trailing).offset(-15)
            make.bottom.equalTo(sectionHeader.snp.bottom).offset(-5)
            make.width.equalTo(70)
        }
    }
}

//MARK: - TableView DataSource & Delegate

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postCellID, for: indexPath)  as! PostCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    //TODO: 사이즈 고정할 건지 정해야함
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
   
    // Section Header 스크롤때마다 나타나고 사라지고 구현
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let y = targetContentOffset.pointee.y

        print(y)
        if y > 0, sectionHeaderRemoved == false {
            sectionHeaderRemoved = true
            sectionHeader.isHidden = true
            
            rightButton.snp.removeConstraints()
            leftButton.snp.removeConstraints()
            
            sectionHeader.snp.updateConstraints { (make) in
                make.height.equalTo(0)
            }
            
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        } else if y == 0, sectionHeaderRemoved == true {
            sectionHeaderRemoved = false
            sectionHeader.isHidden = false
            
            sectionHeader.snp.updateConstraints { (make) in
                make.height.equalTo(50)
            }
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
            
//            UIView.animate(withDuration: 0.5) {
//                self.view.layoutIfNeeded()
//            }
           
        }
        
        
    }
    
}
