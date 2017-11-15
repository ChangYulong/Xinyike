//
//  MLButton.swift
//  JCXinYiKe
//
//  Created by jcwymac on 2017/11/14.
//  Copyright © 2017年 jcwymac. All rights reserved.
//

import UIKit

class MLButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// MARK：- 设置视图
    private func setupUI() {
        //设置imageView
        imageView?.contentMode = .left
        //设置title
        titleLabel?.textAlignment = .left
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
        setTitleColor(UIColor.white, for: UIControlState.normal)
    }
    
    /// 对其子控件重新布局
    override func layoutSubviews() {
        do {
            super.layoutSubviews()
            imageView?.frame = CGRect(x:0, y: 0, width: 12, height: self.frame.height)
            titleLabel?.frame = CGRect(x: 18, y: 0, width: self.frame.width - 12, height: self.frame.height)
        }
    }
    
}
