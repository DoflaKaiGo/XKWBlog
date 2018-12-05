//
//  ProfileVC.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/29.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class ProfileVC: BaseVC {

    override func viewWillAppear(_ animated: Bool) {
        //用户界面将要显示的时候h请求用户信息
        let access_token =  UserDefaults.standard.string(forKey: accessToken)
        let uid =  UserDefaults.standard.string(forKey: userID)
        NetworkTools.shareInstance.requestUserData(methodType: .GET, parameters: ["access_token":access_token as AnyObject,"uid":uid as AnyObject]) { (receiveData, error) in
            if error != nil {return}
            print(receiveData as Any)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        visitorV.setupVistorViewInfo(text: "山有木兮木有枝,心悦君兮君不知", imgName: "visitordiscover_image_profile")
        if !isLogined {return}
    }
    
}
