//
//  DropDownButton.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/27.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit

class DropDownButton: UIButton, DropDownDataSendable {
    
  
    var dropView = DropDownView()
    var height = NSLayoutConstraint()
    var isOpen : Bool = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        dropView.delegate = self
        backgroundColor = .white
        setTitleColor(.black, for: .normal)
        
    }
    
    convenience init(array: [String]) {
        self.init(frame: CGRect.zero)
        self.dropView.dropDownArray = array
        setTitle(dropView.dropDownArray.first, for: .normal)
    }
       
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func dropDownPressed(string: String) {
        self.setTitle(string, for: .normal)
        self.dismissDropDown()
    }
    
    override func didMoveToSuperview() {
        // 드랍뷰에 추가하는게 아니라 드랍뷰의 슈퍼뷰에 추가한다.
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        
        
        dropView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.bottom)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width)
        }
        dropView.translatesAutoresizingMaskIntoConstraints = false
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            if self.dropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.5,
                           options: .curveEaseInOut,
                           animations: {
                            self.dropView.layoutIfNeeded()
                            self.dropView.center.y += self.dropView.frame.height / 2
                           },
                           completion: nil)
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
                   
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.5,
                           options: .curveEaseInOut,
                           animations: {
                            self.dropView.center.y -= self.dropView.frame.height / 2
                            self.dropView.layoutIfNeeded()
                           },
                           completion: nil)
        }
    }
    
    func dismissDropDown() {
        
        isOpen = false
        
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
               
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseInOut,
                       animations: {
                        self.dropView.center.y -= self.dropView.frame.height / 2
                        self.dropView.layoutIfNeeded()
                       },
                       completion: nil)
    }
   
}
