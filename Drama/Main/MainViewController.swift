//
//  MainViewController.swift
//  Drama
//
//  Created by joon-ho kil on 2019/12/28.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var imgArr = (1...6).map{UIImage.init(named: "\($0)")}
    var subscribeDataSource = SubscribeDataSource()
    var hotDataSource = HotDataSource()
    
    @IBOutlet var posterCollectionView: UICollectionView!
    @IBOutlet var subscribeCollectionView: UICollectionView!
    @IBOutlet var hotCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        posterCollectionView.showsHorizontalScrollIndicator = false
        posterCollectionView.isPagingEnabled = true

        posterCollectionView.delegate = self
        posterCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        posterCollectionView.collectionViewLayout = layout
        
        let subscribeLayout = UICollectionViewFlowLayout()
        subscribeLayout.scrollDirection = .horizontal
        
        subscribeCollectionView.delegate = subscribeDataSource
        subscribeCollectionView.dataSource = subscribeDataSource
        subscribeCollectionView.collectionViewLayout = subscribeLayout
        
        hotCollectionView.delegate = hotDataSource
        hotCollectionView.dataSource = hotDataSource
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "posterCell", for: indexPath) as! PosterCell
        
        cell.posterImageView.contentMode = .scaleToFill
        cell.posterImageView.image = imgArr[indexPath.row]
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
