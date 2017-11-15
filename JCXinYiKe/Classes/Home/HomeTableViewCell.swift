//
//  HomeTableViewCell.swift
//  JCXinYiKe
//
//  Created by jcwymac on 2017/11/14.
//  Copyright © 2017年 jcwymac. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLab: UILabel!
    
    var model: AnyObject? {
        get {
            return self.model
        }
        set {
            //设置子控件的frame和值
            setSubView()
        }
    }
    
    var nameLab2: UILabel? //姓名
    var workTypeLab: UILabel? //职业类型
    var moneyLab: UILabel? //钱
    var timeLab: UILabel? //时间
    var lookDetailsLab: UILabel? //查看详情
    var lineView: UIView? //分割线
    var addresslab: UILabel? //地点
    var carLab: UILabel? //车产
    var houseLab: UILabel? //房产
    var soseLab: UILabel? //社保
    var barView: UIView? //分割条
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.selectionStyle = UITableViewCellSelectionStyle.none
        setupUI()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    func setupUI() {
        nameLab2 = createLab(text: "", textColor: UIColor.black, font: UIFont.systemFont(ofSize: 15), imgName: nil)
        contentView.addSubview(nameLab2!)
        workTypeLab = createLab(text: "", textColor: UIColor.gray, font: UIFont.systemFont(ofSize: 12), imgName: nil)
        contentView.addSubview(workTypeLab!)
        timeLab = createLab(text: "", textColor: UIColor.gray, font: UIFont.systemFont(ofSize: 12), imgName: nil)
        contentView.addSubview(timeLab!)
        moneyLab = createLab(text: "", textColor: UIColor.green, font: UIFont.systemFont(ofSize: 14), imgName: nil)
        contentView.addSubview(moneyLab!)
        lineView = UIView()
        lineView?.backgroundColor = UIColor.lightGray
        contentView.addSubview(lineView!)
        lookDetailsLab = createLab(text: "", textColor: UIColor.white, font: UIFont.systemFont(ofSize: 14), imgName: nil)
        contentView.addSubview(lookDetailsLab!)
        addresslab = createLab(text: " 青岛-胶州", textColor: UIColor.lightGray, font: UIFont.systemFont(ofSize: 12), imgName: "bell")
        contentView.addSubview(addresslab!)
        carLab = createLab(text: " 有车产", textColor: UIColor.lightGray, font: UIFont.systemFont(ofSize: 12), imgName: "bell")
        contentView.addSubview(carLab!)
        houseLab = createLab(text: " 有房产", textColor: UIColor.lightGray, font: UIFont.systemFont(ofSize: 12), imgName: "bell")
        contentView.addSubview(houseLab!)
        soseLab = createLab(text: " 有社保", textColor: UIColor.lightGray, font: UIFont.systemFont(ofSize: 12), imgName: "bell")
        contentView.addSubview(soseLab!)
        barView = UIView(frame: CGRect(x: 0, y: 120, width: kScreenW, height: 10))
        barView?.backgroundColor = UIColor.gray
        contentView.addSubview(barView!)
    }
    
    func createLab(text: String, textColor: UIColor, font: UIFont, imgName: String?) -> UILabel {
        let l = UILabel()
        if imgName != nil {
            l.attributedText = Tools.attributedStrM(text: text, imgName: imgName!)
        }else {
            l.textColor = textColor
            l.font = font
        }
        return l
    }
    
    func setSubView() {
        setLabel(lab: nameLab2!, frame: CGRect(x: 10, y: 25, width: 120, height: 30), text: "王强")
        setLabel(lab: workTypeLab!, frame: CGRect(x:10, y: (nameLab2?.frame.maxY)! + 10, width: 200, height: 20), text: "职业：上班族")
        setAttrLabel(lab: moneyLab!, frame: CGRect(x: 160, y: 35, width: 160, height: 30), text: "6000元")
        setLabel(lab: timeLab!, frame: CGRect(x: kScreenW - 70, y: 15, width: 27, height: 20), text: "2小时💰")
        lookDetailsLab?.frame = CGRect(x: kScreenW - 85, y: (timeLab?.frame.maxY)! + 10, width: 70, height: 28)
        lookDetailsLab?.text = "查看详情"
        lookDetailsLab?.textAlignment = .center
        lookDetailsLab?.layer.cornerRadius = 14
        lookDetailsLab?.layer.masksToBounds = true
        lookDetailsLab?.backgroundColor = UIColor.lightGray
        lineView?.frame = CGRect(x: 0, y: (workTypeLab?.frame.maxY)! + 20, width: kScreenW, height: 1)
        
        addresslab?.frame = CGRect(x: 16, y: (lineView?.frame.maxY)! + 6, width: 80, height: 18)
    }
    
    func setAttrLabel(lab: UILabel, frame: CGRect, text: String) {
        let deRange = text.range(of: "元")
        let attributeText = NSMutableAttributedString.init(string: text)
        attributeText.addAttributes([NSAttributedStringKey.foregroundColor : UIColor.black], range: NSMakeRange((deRange?.lowerBound.encodedOffset)!, 1))
        lab.frame = frame
        lab.attributedText = attributeText
        lab.sizeToFit()
    }
    
    func setLabel(lab: UILabel, frame: CGRect, text: String) {
        lab.frame = frame
        lab.text = text
        lab.sizeToFit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
