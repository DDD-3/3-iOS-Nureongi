//
//  ViewController.swift
//  Drama
//
//  Created by joon-ho kil on 2019/11/17.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class UpperTabBarRootViewController: ButtonBarPagerTabStripViewController {

    var scrollView : UIScrollView = {
        var scrView = UIScrollView()
        return scrView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView = self.containerView
        
        configureButtonBar()
        
        setupScrollView()
    }

    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {

         let child1 = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeViewController
         let child2 = self.storyboard?.instantiateViewController(withIdentifier: "Rating") as! RatingViewController
         let child3 = self.storyboard?.instantiateViewController(withIdentifier: "Post") as! PostViewController

         return [child1, child2, child3]
    }
}


// MARK: - 상단 탭바 커스터마이징
extension UpperTabBarRootViewController {
    private func configureButtonBar() {
         // Sets the background colour of the pager strip and the pager strip item
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
         settings.style.selectedBarBackgroundColor = .orange

         // Changing item text color on swipe
         changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
               guard changeCurrentIndex == true else { return }
               oldCell?.label.textColor = .gray
               newCell?.label.textColor = .orange
         }
    }
}

// MARK: - 스크롤뷰 세팅
extension UpperTabBarRootViewController {
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
       
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
        
        scrollView.topAnchor.constraint(equalTo: buttonBarView.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}
