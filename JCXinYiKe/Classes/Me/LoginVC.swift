//
//  LoginVC.swift
//  JCXinYiKe
//
//  Created by jcwymac on 2017/11/14.
//  Copyright © 2017年 jcwymac. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        self.view = mainView
    }

    @IBAction func changeColor(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.view.backgroundColor = UIColor.red
        }else {
            self.view.backgroundColor = UIColor.yellow
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
