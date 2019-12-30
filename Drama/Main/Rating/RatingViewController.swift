//
//  RatingViewController.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/21.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Charts

class RatingViewController: UIViewController, IndicatorInfoProvider {
    //MARK: - Views Start
  
    //MARK: - Views End

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "RATING")
    }
}

//MARK: - UI AutoLayout

extension RatingViewController {
    private func setupAutoLayout() {
     
      
    }
    
 
}

//MARK: - TableView

extension RatingViewController {
    
}
