//
//  PostCellTableViewCell.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/26.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import SnapKit

class PostCell: UITableViewCell {
    
    private var imagePageViewCellID = "imagePageViewCellId"
    
    //MARK: - Views Start
    var cellView: UIView = {
       let cellView = UIView(frame: CGRect.zero)
       return cellView
    }()
    
    lazy var thumbnail: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .horizontal
       let imagePageView = UICollectionView(frame: cellView.frame , collectionViewLayout: layout)
       imagePageView.backgroundColor = .clear
       return imagePageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likeButton, pageController, postButton])
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    var likeButton: UIButton = {
        let likeBtn = UIButton()
        likeBtn.backgroundColor = .red
        return likeBtn
    }()
    
    var pageController: UIPageControl = {
       let pageCount = UIPageControl()
        pageCount.currentPage = 0
        pageCount.currentPageIndicatorTintColor = .red
        pageCount.pageIndicatorTintColor = .gray
        pageCount.numberOfPages = 3
        pageCount.hidesForSinglePage = true
        pageCount.isUserInteractionEnabled = false
        return pageCount
    }()
    
    var postButton: UIButton = {
      let postBtn = UIButton()
      postBtn.backgroundColor = .darkGray
      return postBtn
    }()
    
    var titleLabel: UILabel = {
       let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.text = "동백꽃 필 무렵"
       return lbl
    }()
    
    var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 13)
        lbl.numberOfLines = 0
        lbl.text = "편견에 갇힌 맹수 동백을 깨우는, 촌므파탈 황용식이의 폭격형 로맨스 사랑하면 다 돼! 이들을 둘러싼 생활밀착형 치정 로맨스 사랑 같은 소리하네."
        return lbl
    }()
    //MARK: - Views End
    

    
    
    
    //MARK: - 초기화구문
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(cellView)
        cellView.addSubview(thumbnail)
        self.addSubview(stackView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        
        thumbnail.dataSource = self
        thumbnail.delegate = self
        thumbnail.register(ImagePageViewCell.self, forCellWithReuseIdentifier: imagePageViewCellID)
        thumbnail.isPagingEnabled = true
   
        autoLayoutSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}



//MARK: - UI AutoLayout
extension PostCell {
    private func autoLayoutSetup() {
        cellView.snp.makeConstraints { (make) in
            //make.top.leading.trailing.equalToSuperview().offset(15)
            make.top.equalTo(self.snp.top).offset(15)
            make.leading.equalTo(self.snp.leading).offset(15)
            make.trailing.equalTo(self.snp.trailing).offset(-15)
            make.width.equalTo(self.snp.width).offset(-30)
            make.height.equalTo(150)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(thumbnail.snp.bottom).offset(20)
            make.leading.equalTo(self.snp.leading).offset(15)
            make.trailing.equalTo(self.snp.trailing).offset(-15)
        }
        
        postButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(35)
        }
        
        likeButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(35)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading).offset(15)
            make.top.equalTo(stackView.snp.bottom).offset(10)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(self.snp.leading).offset(15)
            make.trailing.equalTo(self.snp.trailing).offset(-15)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        
        thumbnail.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}


//MARK: - UICollectionView 

extension PostCell: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imagePageViewCellID, for: indexPath) as! ImagePageViewCell
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        layoutIfNeeded()
        return CGSize(width: self.cellView.bounds.width, height: self.cellView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // 페이지 컨트롤과 스크롤뷰 연동
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageController.currentPage = Int(x / self.cellView.frame.width)
        
    }
}
