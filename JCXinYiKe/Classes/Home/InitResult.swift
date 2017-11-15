//
//  InitResult.swift
//  JCXinYiKe
//
//  Created by jcwymac on 2017/11/13.
//  Copyright © 2017年 jcwymac. All rights reserved.
//

import UIKit
import HandyJSON

class InitResult: HandyJSON {
    var businessServiceUrl: String?
    var resourceServiceUrl: String?
    var auditStatus: NSNumber?
    
    required init() {}
}
