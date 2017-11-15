//
//  RequestParam.swift
//  JCXinYiKe
//
//  Created by jcwymac on 2017/11/13.
//  Copyright © 2017年 jcwymac. All rights reserved.
//

import UIKit
import HandyJSON

class RequestParam: HandyJSON {
    var Func: String?
    var user: String?
    var sn: String?
    var params: Any?
    
    required init() {}
    
    func mapping(mapper: HelpingMapper) {
        //指定func 字段用 Func解析
//        mapper.specify(property: &func, name: "Func")
    }
}
