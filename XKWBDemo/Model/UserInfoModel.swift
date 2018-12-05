//
//  UserInfoModel.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/12/5.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit
class UserInfoModel: NSObject {
    let  userName : String
    let userHeadImgUrl:String
    let userDescription : String
    let isVIP : Bool
    let weiboCount : Int
    let friends_count : Int
    let followers_count : Int//粉丝
    let favourites_count : Int
    let gender : String
    let userId : String
    let location : String
  
    init(userDic:[String:AnyObject]){
        userName = userDic["name"] as! String
        userHeadImgUrl = userDic["avatar_large"] as! String
        userDescription = userDic["description"] as! String
        isVIP = false
        weiboCount = 500
        followers_count = userDic["followers_count"] as! Int
        favourites_count = userDic["favourites_count"] as! Int
        friends_count = userDic["friends_count"] as! Int
        gender = userDic["gender"] as! String
        userId = userDic["idstr"] as! String
        location = userDic["location"] as! String
    }
}
