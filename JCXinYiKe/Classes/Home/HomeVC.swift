//
//  HomeVC.swift
//  JCXinYiKe
//
//  Created by jcwymac on 2017/11/13.
//  Copyright © 2017年 jcwymac. All rights reserved.
//

import UIKit
import HandyJSON

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var mainTv: UITableView!
    
    var tableData:[String] = ["我有一个", "我有一个梦想我梦想有一天", "这个国家能站立起来，真正实现其信条的真谛，人人生儿平等", "", "", "", "", ""]
    
    //自定义导航栏
    private lazy var customNavigationBar = UIView()
    //自定义导航栏完全不透明时的偏移量边界（根据需求设定）
    private let alphaChangeBoundary = kScreenW * (212 / 375) - 64
    
    //城市
    fileprivate lazy var leftBtn: MLButton = {[weak self] in
        let leftBtn = MLButton(frame:CGRect(x: 10, y: 20, width: 100, height: 44))
        leftBtn.setTitle("城市", for: UIControlState.normal)
        leftBtn.setImage(UIImage(named: "map"), for: UIControlState.normal)
        leftBtn.imageView?.isHidden = false
        return leftBtn
    }()
    
    //通知
    fileprivate lazy var rightBtn: MLButton = {[weak self] in
        let rightBtn = MLButton(frame:CGRect(x: kScreenW - 60, y: 20, width: 50, height: 44))
        rightBtn.setTitle("通知", for: UIControlState.normal)
        rightBtn.setImage(UIImage(named: "bell"), for: UIControlState.normal)
        return rightBtn
    }()
    
    //搜索框
    fileprivate lazy var searchView: UIView = {[weak self] in
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        mainView.backgroundColor = UIColor.white
        mainView.center = CGPoint(x: kScreenW / 2, y: 20 + 20)
        mainView.layer.cornerRadius = 15
        return mainView
    }()
    
    //头部试图
    fileprivate lazy var tvHeaderView: UIView = {[weak self] in
        let headView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 215))
        headView.backgroundColor = UIColor.blue
        return headView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        //sc适配iOS11
        if #available(iOS 11.0, *) {
            self.mainTv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        }else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        //关于tableview
        self.mainTv.tableHeaderView = tvHeaderView
        self.mainTv.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "hometvcellid")
        self.mainTv.separatorStyle = UITableViewCellSeparatorStyle.none
        self.mainTv.showsVerticalScrollIndicator = false
        //添加导航栏
        customNavigationBar.frame = CGRect(x: 0, y: 0, width: kScreenW, height: 64)
        customNavigationBar.backgroundColor = UIColor.white.withAlphaComponent(0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //界面将显示隐藏系统导航栏，添加自定义导航栏，防止从后面界面pop回此界面时导航栏显示有问题
        navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationController?.view.insertSubview(customNavigationBar, at: 1)
        navigationController?.view.insertSubview(leftBtn, at: 2)
        navigationController?.view.insertSubview(rightBtn, at: 3)
        navigationController?.view.insertSubview(searchView, at: 4)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        customNavigationBar.removeFromSuperview()
        //界面将要消失时，显示系统导航栏，移除自定义的导航栏
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        //调用此方法，解决滑动返回的bug
        performSelector(onMainThread: #selector(HomeVC.delayHidden), with: animated, waitUntilDone: false)
    }
    
    @objc func delayHidden(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    //ScrollView代理方法
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY >= 0 && offsetY <= alphaChangeBoundary {
            customNavigationBar.backgroundColor = UIColor.white.withAlphaComponent(offsetY / alphaChangeBoundary)
        }else if offsetY > alphaChangeBoundary {
            customNavigationBar.backgroundColor = UIColor.white
        }else {
            customNavigationBar.backgroundColor = UIColor.white.withAlphaComponent(0)
        }
        
        if offsetY < 0 {
            UIView.animate(withDuration: 0.1, animations: {
                self.customNavigationBar.alpha = 0
            })
        }else {
            UIView.animate(withDuration: 0.1, animations: {
                self.customNavigationBar.alpha = 1
            })
        }
    }
    
    //tableView代理
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = self.mainTv.dequeueReusableCell(withIdentifier: "hometvcellid") as! HomeTableViewCell
//        cell.nameLab?.text = tableData[indexPath.row]
        
        cell.model = nil
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = UIColor.white
        
        let whiteView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 33))
        v.addSubview(whiteView)
        
        let redView = UIView(frame: CGRect(x: 0, y: whiteView.frame.maxY, width: kScreenW, height: 27))
        redView.backgroundColor = UIColor.init(red: 246 / 255.0, green: 235 / 255.0, blue: 234 / 255.0, alpha: 1.0)
        v.addSubview(redView)
        let tixingLab = UILabel(frame: CGRect(x: 20, y: 0, width: kScreenW, height: 27))
        tixingLab.attributedText = Tools.attributedStrM(text: "  xxx已被抢单", imgName: "bell")
        redView.addSubview(tixingLab)
        return v
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

















extension HomeVC {
    fileprivate func requestData2() {
        let pa = InitParams()
        MainServe.getAppInit(inParam: pa) { (InitResult) in
            print(InitResult.businessServiceUrl as Any)
        }
    }
    fileprivate func requestData() {
        let params = InitParams()
        let param = RequestParam()
        param.Func = "000"
        param.params = params
        let jsonStr = param.toJSONString()!
        let paramterDic = ["json" : jsonStr]
        NetworkTool.request(type: .POST, urlString: kBaseUrl, paramters: paramterDic) { (result) in
            //将result转成字典
            guard let resultDict = result as? [String: Any] else { return }
            print("\(result)")
            //根据data读key，获取数组
            guard let data = resultDict["result"] as? [String: Any] else { return }
            let jsonData = self.getJSONStringFromDictionary(dictionary: data as NSDictionary)
            let responseObject = JSONDeserializer<InitResult>.deserializeFrom(json: jsonData)
            print("\(responseObject)")
        }
    }
    
    func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData!
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }
}
