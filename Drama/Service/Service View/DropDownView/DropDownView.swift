//
//  DropDownView.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/27.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import SnapKit

class DropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var dropDownArray : [String] = []
    
    var tableView = UITableView()
    
    var delegate: DropDownDataSendable?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.textColor = .black
        cell.backgroundColor = .white
        cell.textLabel?.font = .boldSystemFont(ofSize: 14)
        cell.textLabel?.text = dropDownArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.dropDownPressed(string: dropDownArray[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
 
    
}
