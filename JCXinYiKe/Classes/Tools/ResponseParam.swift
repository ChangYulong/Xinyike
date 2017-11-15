//
//  ResponseParam.swift
//  JCXinYiKe
//
//  Created by jcwymac on 2017/11/14.
//  Copyright © 2017年 jcwymac. All rights reserved.
//

import UIKit
import HandyJSON

class ResponseParam: HandyJSON {
    var code: Int?
    var message: String?
    var result: Any?
    
    required init() {}
}
