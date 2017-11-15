//
//  InitParams.swift
//  JCXinYiKe
//
//  Created by jcwymac on 2017/11/13.
//  Copyright © 2017年 jcwymac. All rights reserved.
//

import UIKit
import HandyJSON

class InitParams: HandyJSON {
    var appId: String?
    var deviceId: String?
    var deviceModel: String?
    var verCode: String?
    var verName: String?
    var osType: String?
    var osVersion: String?
    
    required init() {
        self.appId = "101200"
        self.deviceId = ""
        var systemInfo = utsname()
        uname(&systemInfo)
        self.deviceModel = UIDevice.current.model
        self.verCode = (Bundle.main.infoDictionary?[kCFBundleVersionKey! as String] as! String)
        self.verName = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        self.osType = "2"
        self.osVersion = UIDevice.current.systemVersion
    }
}
