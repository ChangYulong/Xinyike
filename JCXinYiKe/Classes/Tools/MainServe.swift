//
//  MainServe.swift
//  JCXinYiKe
//
//  Created by jcwymac on 2017/11/14.
//  Copyright © 2017年 jcwymac. All rights reserved.
//

import UIKit
import HandyJSON

class MainServe: NSObject {
    class func getAppInit(inParam: InitParams, finished: @escaping (_ result: InitResult) -> ()) {
        let param = RequestParam()
        param.Func = "000"
        param.params = inParam
        let jsonStr = param.toJSONString()!
        let paramterDic = ["json" : jsonStr]
        NetworkTool.request(type: .POST, urlString: kBaseUrl, paramters: paramterDic) {(result) in
            //将result转成字典
            guard let resultDict = result as? [String: Any] else { return }
            guard let data = resultDict["result"] as? [String: Any] else { return }
            let jsonData = getJSONStringFromDictionary(dictionary: data as NSDictionary)
            let responseObject = JSONDeserializer<InitResult>.deserializeFrom(json: jsonData)
            finished((responseObject as AnyObject) as! InitResult)
        }
    }
    
    /// 字典转json
    ///
    /// - Parameter dictionary:
    /// - Returns: 
    class func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData!
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }
}
