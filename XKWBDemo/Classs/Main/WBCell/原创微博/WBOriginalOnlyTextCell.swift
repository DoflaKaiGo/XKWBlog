//
//  RiginalWBOnlyTextCell.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/12/4.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit
import SnapKit

class WBOriginalOnlyTextCell: UITableViewCell {
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
    lazy var footerView = UIView()
    
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
    
    override func layoutSubviews() {
        setUpSubViewsData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension WBOriginalOnlyTextCell{
 private   func setUpSubViews() {
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
        
  
    }
    
  private  func addSubViewsToView() {
        contentView.addSubview(headImgView)
        contentView.addSubview(vipImgView)
        contentView.addSubview(userNameLable)
        contentView.addSubview(subtitleLable)
        contentView.addSubview(vipLevelImgV)
        contentView.addSubview(userTypeImgV)
        contentView.addSubview(advImageBtn)
        contentView.addSubview(rightOptionalBtn)
        contentView.addSubview(textLable)
        contentView.addSubview(grayLineV)
        contentView.addSubview(shareBtn)
        contentView.addSubview(commentBtn)
        contentView.addSubview(supportBtn)
        contentView.addSubview(footerView)
    }
    
 private   func setUpSubviewsLayout() {
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
        grayLineV.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().offset(0)
            make.top.equalTo(textLable.snp.bottom).offset(10)
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
}


extension WBOriginalOnlyTextCell{
   private func  setUpSubViewsData(){
    //设置假数据
    headImgView.image =  #imageLiteral(resourceName: "B_Image_2")
    vipImgView.image = #imageLiteral(resourceName: "avatar_enterprise_vip")
    userNameLable.text = "坚定的锡兵"
    vipLevelImgV.image = #imageLiteral(resourceName: "common_icon_membership_level6")
    userTypeImgV.image = #imageLiteral(resourceName: "avatar_grassroot")
    advImageBtn.setImage(#imageLiteral(resourceName: "back_music"), for: .normal)
    advImageBtn.clipsToBounds = true
    rightOptionalBtn.setTitle("关注", for: .normal)
    rightOptionalBtn.layer.borderColor = UIColor.orange.cgColor
    rightOptionalBtn.layer.borderWidth = 1
    rightOptionalBtn.layer.cornerRadius = 2
    rightOptionalBtn.layer.masksToBounds = true
    rightOptionalBtn.setTitleColor(UIColor.orange, for: .normal)
    subtitleLable.text = "2小时前 来自 weibo.com"
    textLable.text = "你们一点也不象我的那朵玫瑰，你们还什么都不是呢!”小王子对她们说。“没有人驯服过你们，你们也没有驯服过任何人。你们就象我的狐狸过去那样,它那时只是和千万只别的狐狸一样的一只狐狸。但是，我现在已经把它当成了我”的朋友，于是它现在就是世界.上独一无二的了。“夜晚，当你望着天空的时候，既然我就住在其中一颗星星上，既然我在其中一颗星星上笑着，那么对你来说，就好象所有的星星都在笑，那么你将看到的星星就是会笑的星星！”"
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
}
