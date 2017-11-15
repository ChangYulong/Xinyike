//
//  Tools.swift
//  JCXinYiKe
//
//  Created by jcwymac on 2017/11/15.
//  Copyright © 2017年 jcwymac. All rights reserved.
//

import UIKit

class Tools: NSObject {
    class func attributedStrM(text: String, imgName: String) -> NSMutableAttributedString {
        //定义富文本既有格式的字符串
        let attributedStrM: NSMutableAttributedString = NSMutableAttributedString()
        
        let name: NSAttributedString = NSAttributedString(string: text, attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12.0)])
        let smileImg: UIImage = UIImage(named: imgName)!
        let textAttachment: NSTextAttachment = NSTextAttachment()
        textAttachment.image = smileImg
        textAttachment.bounds = CGRect(x: 0, y: -4, width: 16, height: 18)
        
        attributedStrM.append(NSAttributedString(attachment: textAttachment))
        attributedStrM.append(name)
        
        return attributedStrM
    }

}
