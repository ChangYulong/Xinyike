//
//  MeVC.swift
//  JCXinYiKe
//
//  Created by jcwymac on 2017/11/13.
//  Copyright © 2017年 jcwymac. All rights reserved.
//

import UIKit

class MeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(frame:CGRect(x: 100, y: 140, width: 120, height: 40))
        button.setTitle("跳转按钮", for: UIControlState.normal)
        button.setTitleColor(UIColor.blue, for: UIControlState.normal)
        button.backgroundColor = UIColor.orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(btnClick(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
        let l = UILabel(frame: CGRect(x: 100, y: 200, width: 120, height: 22))
        l.attributedText = FuWebBenDemo()
        self.view.addSubview(l)
        
        let dateBtn = UIButton(frame:CGRect(x: 100, y: 240, width: 120, height: 40))
        dateBtn.setTitle("日期控制器", for: UIControlState.normal)
        dateBtn.setTitleColor(UIColor.red, for: UIControlState.normal)
        dateBtn.backgroundColor = UIColor.white
        dateBtn.addTarget(self, action: #selector(dateBtnAction(_ :)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(dateBtn)
    }
    
    @objc func dateBtnAction(_ button: UIButton) {
        
    }
    
    
    @objc func btnClick(_ button: UIButton) {
        print("ddd");
        let loginVc = LoginVC()
        self.navigationController?.pushViewController(loginVc, animated: true)
    }
    
    fileprivate func FuWebBenDemo() -> NSMutableAttributedString {
        //定义富文本既有格式的字符串
        let attributedStrM: NSMutableAttributedString = NSMutableAttributedString()
        
        let name: NSAttributedString = NSAttributedString(string: "常玉龙", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15.0)])
        
        let smileImg: UIImage = UIImage(named: "bell")!
        let textAttachment: NSTextAttachment = NSTextAttachment()
        textAttachment.image = smileImg
        textAttachment.bounds = CGRect(x: 0, y: -4, width: 22, height: 22)
        
        attributedStrM.append(NSAttributedString(attachment: textAttachment))
        attributedStrM.append(name)
        
        return attributedStrM
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
