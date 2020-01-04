//
//  RatingViewController.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/21.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SnapKit
import Charts

class RatingViewController: UIViewController, IndicatorInfoProvider {
    //MARK: - Views Start
  
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = self.contentView.bounds.size
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    var averageGrade: ChartView = {
        let average = ChartView(type: .average)
        return average
    }()
    
    var episodeGrade: ChartView = {
        let episode = ChartView(type: .episode)
        return episode
    }()
    
    var myGrade: ChartView = {
        let my = ChartView(type: .my)
        return my
    }()

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAutoLayout()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "RATING")
    }
}

//MARK: - UI AutoLayout

extension RatingViewController {
    private func setupAutoLayout() {
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        
        self.contentView.addSubview(averageGrade)
        self.contentView.addSubview(episodeGrade)
        self.contentView.addSubview(myGrade)
        
        scrollView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.width.equalTo(self.view.snp.width)
        }
        
        averageGrade.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(280)
        }
        
        episodeGrade.snp.makeConstraints { (make) in
            make.top.equalTo(averageGrade.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(280)
        }
        
        myGrade.snp.makeConstraints { (make) in
            make.top.equalTo(episodeGrade.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(280)
        }
      
    }
    
 
}


