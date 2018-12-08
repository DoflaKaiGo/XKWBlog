//
//  WBOriginalNineImgCell.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/12/6.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class WBOriginalNineImgCell: UITableViewCell {
    lazy var headImgView =  UIImageView();
    lazy var vipImgView = UIImageView()
    lazy var userNameLable = UILabel()
    lazy var subtitleLable = UILabel()
    lazy var vipLevelImgV = UIImageView()
    lazy var userTypeImgV = UIImageView()
    lazy var advImageBtn = UIButton(type: UIButton.ButtonType.custom)
    lazy var rightOptionalBtn = UIButton(type: UIButton.ButtonType.custom)
    lazy var textLable = UILabel()
    lazy var grayLineV = UIView()
    lazy var shareBtn = UIButton(type: UIButton.ButtonType.custom)
    lazy var commentBtn = UIButton(type: UIButton.ButtonType.custom)
    lazy var supportBtn = UIButton(type: UIButton.ButtonType.custom)
    lazy var imgOne  = UIImageView()
    lazy var imgTwo  = UIImageView()
    lazy var imgThree  = UIImageView()
    lazy var imgFour  = UIImageView()
    lazy var imgFive  = UIImageView()
    lazy var imgSix  = UIImageView()
    lazy var imgSeven  = UIImageView()
    lazy var imgEight  = UIImageView()
    lazy var imgNine  = UIImageView()
    lazy var footerView = UIView()
    private var imgVs:[UIImageView] {
        get {
            return  [imgOne,imgTwo,imgThree,imgFour,imgFive,imgSix,imgSeven,imgEight,imgNine]
        }
    }
    let imgWidth = (ScreenInfo.ScreenWidth - 30)/3
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViewsToView()
        setUpSubViews()
        setUpSubviewsLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setWBDataWithModel(model:WBDataInfoModel){
//        var imageSdataArray = [Data]()
//        DispatchQueue.global().async {
//             let headimgData = try! NSData(contentsOf:NSURL(string: model.user.userHeadImgUrl)! as URL) as Data
//            for imgStr in model.imagesUrl!{
//                let imgData = try! NSData(contentsOf:NSURL(string: imgStr)! as URL) as Data
//                imageSdataArray.append(imgData)
//            }
//            DispatchQueue.main.async {
//                  self.headImgView.image = UIImage(data:headimgData)
//                for (index,value) in imageSdataArray.enumerated(){
//                    self.imgVs[index].image = UIImage(data:value )
//                }
//            }
//        }
        for (index,value) in model.imagesUrl!.enumerated(){
            self.imgVs[index].af_setImage(withURL:URL(string: value)! , placeholderImage: #imageLiteral(resourceName: "mainButton"))
        }
        let url = URL(string: model.user.userHeadImgUrl)
        self.headImgView.af_setImage(withURL:url! , placeholderImage: #imageLiteral(resourceName: "mainButton"))
        
        shareBtn.setTitle(String(model.reposts_count), for: .normal)
        commentBtn.setTitle(String(model.comments_count), for: .normal)
        supportBtn.setTitle(String(model.attitudes_count), for: .normal)
        userNameLable.text = model.user.userName
        textLable.text = model.text
    }
    
    func setUpSubViews() {
        headImgView.layer.cornerRadius = 25
        headImgView.layer.masksToBounds = true
        vipImgView.layer.cornerRadius = 10
        vipImgView.layer.masksToBounds = true
        vipImgView.layer.borderColor = UIColor.yellow.cgColor
        vipImgView.layer.borderWidth = 2
        userNameLable.textAlignment = .right
        userNameLable.font = UIFont.systemFont(ofSize: 15)
        userNameLable.textColor = UIColor.red
        subtitleLable.font = UIFont.systemFont(ofSize: 12)
        textLable.font = UIFont.systemFont(ofSize: 16)
        rightOptionalBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        shareBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        commentBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        supportBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        textLable.numberOfLines = 0
        grayLineV.backgroundColor = UIColor(red: 231/255.0, green: 231/255.0, blue: 231/255.0, alpha: 0.5)
        footerView.backgroundColor = UIColor(red: 231/255.0, green: 231/255.0, blue: 231/255.0, alpha: 1)
        subtitleLable.textColor = UIColor.darkGray
        textLable.textColor = UIColor(white: 78/255.0, alpha: 1)
        headImgView.contentMode = .scaleToFill
        vipImgView.contentMode = .scaleAspectFit
        vipLevelImgV.contentMode = .scaleAspectFit
        userTypeImgV.contentMode = .scaleAspectFit
        imgOne.contentMode = .scaleToFill
        imgTwo.contentMode = .scaleToFill
        imgThree.contentMode = .scaleToFill
        imgFour.contentMode = .scaleToFill
        imgFive.contentMode = .scaleToFill
        imgSix.contentMode = .scaleToFill
        imgSeven.contentMode = .scaleToFill
        imgEight.contentMode = .scaleToFill
        imgNine.contentMode = .scaleToFill
        
        //设置假数据
        headImgView.image =  #imageLiteral(resourceName: "back_me")
        vipImgView.image = #imageLiteral(resourceName: "avatar_enterprise_vip")
        userNameLable.text = "海棠花未眠"
        vipLevelImgV.image = #imageLiteral(resourceName: "common_icon_membership_level5")
        userTypeImgV.image = #imageLiteral(resourceName: "avatar_grassroot")
        advImageBtn.setImage(#imageLiteral(resourceName: "button_back"), for: .normal)
        imgOne.image = UIImage(named: "B_Image_2")
        imgTwo.image = UIImage(named: "B_Image_2")
        imgThree.image = UIImage(named: "B_Image_2")
        imgFour.image = UIImage(named: "B_Image_3")
        imgFive.image = UIImage(named: "B_Image_3")
        imgSix.image = UIImage(named: "B_Image_3")
          imgSeven.image = UIImage(named: "B_Image_4")
          imgEight.image = UIImage(named: "B_Image_4")
          imgNine.image = UIImage(named: "B_Image_4")
        advImageBtn.clipsToBounds = true
        rightOptionalBtn.setTitle("关注", for: .normal)
        rightOptionalBtn.layer.borderColor = UIColor.orange.cgColor
        rightOptionalBtn.layer.borderWidth = 1
        rightOptionalBtn.layer.cornerRadius = 2
        rightOptionalBtn.layer.masksToBounds = true
        rightOptionalBtn.setTitleColor(UIColor.orange, for: .normal)
        subtitleLable.text = "半小时前 来自 iPhone"
        textLable.text = "当秋天过去，冷风吹过街头的时节，她开始不时地依在我的胳膊上。透过粗花呢厚厚的质地，我可以微微感觉出直子的呼吸。她时而挽起我的胳膊，时而把手插进我的大衣口袋里。特别冷的时候，就紧贴着我身旁籁籁发抖，但仅此而已。她的这些动作并无更深的含义。我双手插进大衣兜，一如往常地走动不止。我和直子穿的都是胶底鞋，几乎听不见两人的脚步声，只有踩上路面硕大的法国梧桐落叶的时候，才发出嚓擦的干燥声响。而一听到这种声响，我便可怜起直子来。她所希求的并非我的臂，而是某人的臂。她所希求的并非我的体温，而是某人的体温。而我只能是我，于是我觉得有些愧疚。 直子时常目不转睛地注视我的眼睛，那并无什么缘由，而又似乎有所寻觅。每当这时，我便产生无可名状的寂寞、凄苦的心绪。 如果可能的话，有时我真想将她紧紧地一把搂在怀里，但又总是怅惘作罢。我生怕万一因此而伤害直子。这样，我们继续在东京街头行走不止，直子在空漠中继续苦吟不休。"
        shareBtn.setTitle("145", for: .normal)
        shareBtn.setTitleColor(UIColor.gray, for: .normal)
        commentBtn.setTitleColor(UIColor.gray, for: .normal)
        supportBtn.setTitleColor(UIColor.gray, for: .normal)
        commentBtn.setTitle("521", for: .normal)
        supportBtn.setTitle("297", for: .normal)
        shareBtn.setImage(UIImage(named:"timeline_icon_retweet"), for: .normal)
        commentBtn.setImage(UIImage(named:"timeline_icon_comment"), for: .normal)
        supportBtn.setImage(UIImage(named:"timeline_icon_unlike"), for: .normal)
    }
    
    func addSubViewsToView() {
        contentView.addSubview(headImgView)
        contentView.addSubview(vipImgView)
        contentView.addSubview(userNameLable)
        contentView.addSubview(subtitleLable)
        contentView.addSubview(vipLevelImgV)
        contentView.addSubview(userTypeImgV)
        contentView.addSubview(advImageBtn)
        contentView.addSubview(rightOptionalBtn)
        contentView.addSubview(textLable)
        contentView.addSubview(imgOne)
        contentView.addSubview(imgTwo)
        contentView.addSubview(imgThree)
         contentView.addSubview(imgFour)
         contentView.addSubview(imgFive)
         contentView.addSubview(imgSix)
         contentView.addSubview(imgSeven)
         contentView.addSubview(imgEight)
         contentView.addSubview(imgNine)
        contentView.addSubview(grayLineV)
        contentView.addSubview(shareBtn)
        contentView.addSubview(commentBtn)
        contentView.addSubview(supportBtn)
        contentView.addSubview(footerView)
    }
    
    func setUpSubviewsLayout() {
        headImgView.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
        }
        vipImgView.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.right.equalTo(headImgView).offset(3)
            make.bottom.equalTo(headImgView).offset(3)
        }
        userNameLable.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.width.greaterThanOrEqualTo(10)
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(headImgView.snp.right).offset(10)
        }
        vipLevelImgV.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(userNameLable.snp.right).offset(5)
        }
        userTypeImgV.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(vipLevelImgV.snp.right).offset(5)
        }
        rightOptionalBtn.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(50)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
        }
        advImageBtn.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(30)
            make.top.equalToSuperview().offset(10)
            make.right.equalTo(rightOptionalBtn.snp.left).offset(-5)
        }
        subtitleLable.snp.makeConstraints { (make) in
            make.width.greaterThanOrEqualTo(20)
            make.height.equalTo(20)
            make.top.equalTo(userNameLable.snp.bottom).offset(0)
            make.left.equalTo(headImgView.snp.right).offset(10)
        }
        textLable.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(subtitleLable.snp.bottom).offset(10)
            make.height.lessThanOrEqualTo(150)
        }
        imgOne.snp.makeConstraints { (make) in
            make.width.equalTo(imgWidth)
            make.height.equalTo(imgWidth)
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(textLable.snp.bottom).offset(10)
        }
        imgTwo.snp.makeConstraints { (make) in
            make.width.equalTo(imgWidth)
            make.height.equalTo(imgWidth)
            make.left.equalTo(imgOne.snp.right).offset(5)
            make.top.equalTo(textLable.snp.bottom).offset(10)
        }
        imgThree.snp.makeConstraints { (make) in
            make.width.equalTo(imgWidth)
            make.height.equalTo(imgWidth)
            make.left.equalTo(imgTwo.snp.right).offset(5)
            make.top.equalTo(textLable.snp.bottom).offset(10)
        }
        imgFour.snp.makeConstraints { (make) in
            make.width.equalTo(imgWidth)
            make.height.equalTo(imgWidth)
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(imgOne.snp.bottom).offset(5)
        }
        imgFive.snp.makeConstraints { (make) in
            make.width.equalTo(imgWidth)
            make.height.equalTo(imgWidth)
            make.top.equalTo(imgTwo.snp.bottom).offset(5)
            make.left.equalTo(imgFour.snp.right).offset(5)
        }
        imgSix.snp.makeConstraints { (make) in
            make.width.equalTo(imgWidth)
            make.height.equalTo(imgWidth)
            make.top.equalTo(imgThree.snp.bottom).offset(5)
            make.left.equalTo(imgFive.snp.right).offset(5)
        }
        imgSeven.snp.makeConstraints { (make) in
            make.width.equalTo(imgWidth)
            make.height.equalTo(imgWidth)
            make.top.equalTo(imgFour.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
        }
        imgEight.snp.makeConstraints { (make) in
            make.width.equalTo(imgWidth)
            make.height.equalTo(imgWidth)
            make.top.equalTo(imgFour.snp.bottom).offset(5)
            make.left.equalTo(imgSeven.snp.right).offset(5)
        }
        imgNine.snp.makeConstraints { (make) in
            make.width.equalTo(imgWidth)
            make.height.equalTo(imgWidth)
            make.top.equalTo(imgFour.snp.bottom).offset(5)
            make.left.equalTo(imgEight.snp.right).offset(5)
        }
        grayLineV.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().offset(0)
            make.top.equalTo(imgNine.snp.bottom).offset(10)
            make.height.equalTo(1)
        }
        commentBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView.snp.centerX)
            make.height.equalTo(30)
            make.width.equalTo(ScreenInfo.ScreenWidth / 3 - 20)
            make.top.equalTo(grayLineV.snp.bottom).offset(5)
        }
        shareBtn.snp.makeConstraints { (make) in
            make.height.width.equalTo(commentBtn)
            make.centerY.equalTo(commentBtn.snp.centerY)
            make.right.equalTo(commentBtn.snp.left).offset(0)
        }
        supportBtn.snp.makeConstraints { (make) in
            make.height.width.equalTo(commentBtn)
            make.centerY.equalTo(commentBtn.snp.centerY)
            make.left.equalTo(commentBtn.snp.rightMargin).offset(0)
        }
        footerView.snp.makeConstraints { (make) in
            make.top.equalTo(commentBtn.snp.bottom).offset(0)
            make.width.equalTo(ScreenInfo.ScreenWidth)
            make.bottom.equalToSuperview().offset(0)
            make.height.equalTo(10)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
