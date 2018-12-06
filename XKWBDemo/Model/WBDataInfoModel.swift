//
//  WBDataInfoModel.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/12/5.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class WBDataInfoModel: NSObject {
    let id :String
    let user: UserInfoModel
    let created_at : String
    let text : String?
    let imageUrls : [[String:String]]? //图片数组 thumbnail_pic
    let source : String? // 来源
    let favorited : Bool?//是否被收藏
    let  thumbnail_pic : String? //缩略图地址
    let  bmiddle_pic : String? //中等图地址
    let  original_pic : String? //原始图地址
    let geo : String? //位置字段
    let retweeted_status : String? // 被转发的消息
    let reposts_count : Int//转发数
    let comments_count : Int//l评论数
    let attitudes_count  : Int //点赞
    var  imagesUrl :[String]?  {
        get {
            var images  = [String]();
           if  let imageurlS = imageUrls {
            for url:[String:String] in imageurlS {
                images.append(url["thumbnail_pic"]!)
             }
            }
                return images
        }
    }
    
    
     init(wbDataDic:[String:AnyObject]){
        id = wbDataDic["idstr"] as! String
        user = UserInfoModel(userDic: wbDataDic["user"] as! [String : AnyObject])
        created_at  = wbDataDic["created_at"] as! String
        text = wbDataDic["text"] as? String
        imageUrls = wbDataDic["pic_urls"] as? Array
        source = wbDataDic["source"] as? String
        favorited = (wbDataDic["favorited"] != nil)
        thumbnail_pic = wbDataDic["thumbnail_pic"] as? String
        bmiddle_pic = wbDataDic["bmiddle_pic"] as? String
        original_pic = wbDataDic["original_pic"] as? String
        geo = wbDataDic["geo"] as? String ?? "忘川"
        retweeted_status = wbDataDic["retweeted_status"] as? String
        reposts_count = wbDataDic["reposts_count"] as! Int
        comments_count = wbDataDic["comments_count"] as! Int
        attitudes_count = wbDataDic["attitudes_count"] as! Int
    }
}
