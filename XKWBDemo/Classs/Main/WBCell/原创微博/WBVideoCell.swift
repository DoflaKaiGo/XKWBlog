//
//  WBVideoCell.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/12/4.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class WBVideoCell: UITableViewCell {

    @IBOutlet weak var vipImgV: UIImageView!//vip标志图像
    @IBOutlet weak var headimgV: UIImageView!//头像
    @IBOutlet weak var userNameLab: UILabel!//用户名
    @IBOutlet weak var userLevelImg: UIImageView!//vip等级图片
    @IBOutlet weak var userTypeImg: UIImageView!//用户类型图片
    @IBOutlet weak var subTitleLab: UILabel!//微博发送时间和方式
    @IBOutlet weak var adImgv: UIImageView!//用户名右边的广告图片
    @IBOutlet weak var optionalBtn: UIButton!////最右边按钮,未关注的始关注按钮,关注的始底部弹窗
    @IBOutlet weak var textLable: UILabel!//文本内容
    @IBOutlet weak var videoTitle: UILabel!//视频标题
    @IBOutlet weak var videoView: UIView!//视频View
    @IBOutlet weak var videoCallbackBtn: UIButton!//播放反馈按钮
    @IBOutlet weak var playCountLable: UILabel!//播放次数
    @IBOutlet weak var descriptionLable: UILabel!//播放次数下方的描述lable
    
    @IBOutlet weak var shareBtn: UIButton!//分享按钮
    @IBOutlet weak var commentBtn: UIButton!//评论按钮
    @IBOutlet weak var supportBtn: UIButton!//点赞按钮
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setWBDataWithModel(model:WBDataInfoModel){
        DispatchQueue.global().async {
            let headimgData = try! NSData(contentsOf:NSURL(string: model.user.userHeadImgUrl)! as URL) as Data
            DispatchQueue.main.async {
                self.headimgV.image = UIImage(data:headimgData)
            }
        }
        userNameLab.text = model.user.userName
        textLable.text = model.text
    }
    override func draw(_ rect: CGRect) {
        headimgV.layer.cornerRadius = 25
        headimgV.layer.masksToBounds = true
        vipImgV.layer.cornerRadius = 10
        vipImgV.layer.masksToBounds = true
        vipImgV.layer.borderColor = UIColor.yellow.cgColor
        vipImgV.layer.borderWidth = 2
        videoCallbackBtn.layer.cornerRadius = 10
        videoCallbackBtn.layer.masksToBounds = true
        
        //设置渐变色
        let gradientColors = [UIColor.gray.cgColor,UIColor.lightGray.cgColor]
        let gradientLocations:[NSNumber] = [0.1, 0.9]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        //设置渲染的起始结束位置
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        //设置其CAGradientLayer对象的frame，并插入view的layer
        gradientLayer.frame = videoView!.bounds
       videoView.layer.insertSublayer(gradientLayer, at: 0)
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    //点击分享按钮
    @IBAction func clickShareBtn(_ sender: UIButton) {
        print("点击分享按钮")
    }
      //点击评论按钮
    @IBAction func clickCommentBtn(_ sender: UIButton) {
          print("点击评论按钮")
    }
      //点击点赞按钮
    @IBAction func clickSupportBtn(_ sender: UIButton) {
          print("点击点赞按钮")
    }
    @IBAction func clickOptionBtn(_ sender: UIButton) {
        print("点击了右侧按钮")
    }
    

}

extension WBVideoCell {
    
}
