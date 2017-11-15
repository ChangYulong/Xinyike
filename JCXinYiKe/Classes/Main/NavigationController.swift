//
//  NavigationController.swift
//  JCXinYiKe
//
//  Created by jcwymac on 2017/11/13.
//  Copyright © 2017年 jcwymac. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //UINavigationBar.appearance().barTintColor = UIColor.white
        //设置naviBar背景图片
        UINavigationBar.appearance().setBackgroundImage(UIImage.init(named: "navigationbarBackgroundWhite"), for: UIBarMetrics.default)
        // 设置title的字体
        // UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 20)]
        self.interactivePopGestureRecognizer?.delegate = nil
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count < 1 {
            viewController.navigationItem.rightBarButtonItem = setRightButton()
        }else {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = setBackBarButtonItem()
        }
        super.pushViewController(viewController, animated: true)
    }
    
    // MARK: - private method
    func setBackBarButtonItem() -> UIBarButtonItem {
        let backButton = UIButton.init(type: .custom)
        backButton.setImage(UIImage(named: "setting_back"), for: .normal)
        backButton.sizeToFit()
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        backButton.addTarget(self, action: #selector(NavigationController.backClick), for: .touchUpInside)
        return UIBarButtonItem.init(customView: backButton)
    }
    
    //设置导航栏右边按钮
    func setRightButton() -> UIBarButtonItem {
        let searchItem = UIButton.init(type: .custom)
        searchItem.setImage(UIImage(named: "searchbutton_nor"), for: .normal)
        searchItem.sizeToFit()
        searchItem.frame.size = CGSize(width: 30, height: 30)
        searchItem.contentHorizontalAlignment = .right
        searchItem.addTarget(self, action: #selector(NavigationController.searchClick), for: .touchUpInside)
        return UIBarButtonItem.init(customView: searchItem)
    }
    
    //点击右边的搜索
    @objc func searchClick() {
//        let searchvc = SearchVC()
//        self.pushViewController(searchvc, animated: true)
    }
    
    //返回
    @objc func backClick() {
        self.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
