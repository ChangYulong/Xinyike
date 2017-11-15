//
//  BaseVC.swift
//  JCXinYiKe
//
//  Created by jcwymac on 2017/11/13.
//  Copyright © 2017年 jcwymac. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    var contentView: UIView?
    fileprivate lazy var loadView: UIView = { [unowned self] in
        let view = UIView()
        view.frame = CGRect(origin: .zero, size: CGSize(width: kScreenW, height: kScreenH - kNavigationBarH - 2 * kTabBarH))
        return view;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension BaseVC {
    func setupUI() {
        contentView?.isHidden = true
        view.addSubview(loadView)
        view.backgroundColor = BGCOLOR
    }
    
    func loadDataFinished() {
        loadView.isHidden = true
        contentView?.isHidden = false
    }
    
    func resetData() {
        loadView.isHidden = false
        contentView?.isHidden = true
    }
}
