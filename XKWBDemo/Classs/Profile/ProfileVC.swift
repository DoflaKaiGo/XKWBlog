//
//  ProfileVC.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/29.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class ProfileVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        visitorV.setupVistorViewInfo(text: "山有木兮木有枝,心悦君兮君不知", imgName: "visitordiscover_image_profile")
        if !isLogin {
            return
        }
        
    }
    
}
