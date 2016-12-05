//
//  HomeBangumiTopFoot.swift
//  zhnbilibili
//
//  Created by zhn on 16/12/4.
//  Copyright © 2016年 zhn. All rights reserved.
//

import UIKit

@objc protocol HomeBangumiTopFootDelegate {
    @objc optional func HomeBangumiTopFootBannerClickIndex(index: Int)
}

class HomeBangumiTopFoot: UICollectionReusableView {
    
    // MARK: - 代理
    weak var delegate: HomeBangumiTopFootDelegate?
    
    // MARK: - 懒加载控件
    lazy var carouselView: ZHNCarouselView = {
        let carouselView = ZHNCarouselView(viewframe: CGRect(x: 0, y: 0, width: kscreenWidth, height: kcarouselHeight))
        return carouselView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(carouselView)
        carouselView.layer.cornerRadius = 6
        carouselView.layer.masksToBounds = true
        carouselView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        carouselView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: kpadding, bottom: 0, right: kpadding))
        }
    }
}

extension HomeBangumiTopFoot: ZHNcarouselViewDelegate {
    func ZHNcarouselViewSelectedIndex(index: Int) {
        if let delegate = delegate {
            if let method = delegate.HomeBangumiTopFootBannerClickIndex{
                method(index)
            }
        }
    }
}
