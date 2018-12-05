//
//  WBOneImageCell.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/12/5.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class WBOriginalOneImageCell: UITableViewCell {
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
    lazy var pictureImg  = UIImageView()
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
        setSubViewsData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        pictureImg.contentMode = .scaleAspectFit
    }
    
    private func  setSubViewsData(){
    //设置假数据
    headImgView.image =  #imageLiteral(resourceName: "B_Image_3")
    vipImgView.image = #imageLiteral(resourceName: "avatar_enterprise_vip")
    userNameLable.text = "薛定谔の喵"
    vipLevelImgV.image = #imageLiteral(resourceName: "common_icon_membership_level5")
    userTypeImgV.image = #imageLiteral(resourceName: "avatar_grassroot")
    advImageBtn.setImage(#imageLiteral(resourceName: "button_back"), for: .normal)
    pictureImg.image = UIImage(named: "mainButton")
    advImageBtn.clipsToBounds = true
    rightOptionalBtn.setTitle("关注", for: .normal)
    rightOptionalBtn.layer.borderColor = UIColor.orange.cgColor
    rightOptionalBtn.layer.borderWidth = 1
    rightOptionalBtn.layer.cornerRadius = 2
    rightOptionalBtn.layer.masksToBounds = true
    rightOptionalBtn.setTitleColor(UIColor.orange, for: .normal)
    subtitleLable.text = "半小时前 来自 iPhone"
    textLable.text = "她总是戴一个发卡，总是用手摸它，而且总是用晶莹澈明的眸子凝视我的眼睛。她身披一件蓝色睡衣，在沙发上抱膝而坐，下额搭在膝头。就是这样，直子的形象如同汹涌而来的潮水向我联翩袭来，将我的身体冲往奇妙的地带。在这奇妙地带里，我同死者共同生活。直子也在这里活着，同我交谈，同我拥抱。 直子在这里仍在含有死的前提下继续生存，并且对我这样说：“不要紧，渡边君，那不过是一死罢了，别介意。”在这样的地方，我感觉不出悲哀为何物。因为死是死，直子是直子。“瞧，这有什么，我不是在这里么？”直子羞涩地笑着说道。她这一如往日的平平常常的一言一行，使我顿感释然，心绪平和如初。于是我这样想道：如果说这就是所谓死，则死并不坏。“是啊，死有什么大不了的。”直子说，“死单单是死罢了。再说我在这里觉得非常快活。”直子在浊浪轰鸣的间歇里这样告诉我。 而直子的死还使我明白：无论谙熟怎样的真理，也无以解除所爱之人的死带来的悲哀。无论怎样的哲理，怎样的真诚，怎样的坚韧，怎样的柔情，也无以排遣这种悲哀。我们惟一能做到的，就是从这片悲哀中挣脱出来，并从中领悟某种哲理。而领悟后的任何哲理，在继之而来的意外悲哀面前，又是那样地软弱无力"
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
        contentView.addSubview(pictureImg)
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
        pictureImg.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(200)
            make.height.lessThanOrEqualTo(250)
            make.left.equalToSuperview().offset(40)
            make.top.equalTo(textLable.snp.bottom).offset(10)
        }
        grayLineV.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().offset(0)
            make.top.equalTo(pictureImg.snp.bottom).offset(10)
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
