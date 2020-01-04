//
//  ViewController.swift
//  Drama
//
//  Created by joon-ho kil on 2019/11/17.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class UpperTabbarContainerViewController: ButtonBarPagerTabStripViewController {


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonTabBarDesign()
        
        
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let home = HomeViewController()
        let rating = RatingViewController()
        
        return [home, rating]
    }
    
    
}

// MARK:- 상단버튼탭바 커스터마이징
extension UpperTabbarContainerViewController {
    func buttonTabBarDesign() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
       

        // Sets the pager strip item font and font color
        settings.style.buttonBarItemFont = UIFont(name: "Helvetica", size: 16.0)!
        settings.style.buttonBarItemTitleColor = .gray

        // Sets the pager strip item offsets
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0

        // Sets the height and colour of the slider bar of the selected pager tab
        settings.style.selectedBarHeight = 3.0
        settings.style.selectedBarBackgroundColor = .white

        // Changing item text color on swipe
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
              guard changeCurrentIndex == true else { return }
              oldCell?.label.textColor = .gray
              newCell?.label.textColor = .orange
        }
    }
}
