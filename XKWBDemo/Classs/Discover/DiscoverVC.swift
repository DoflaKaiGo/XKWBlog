//
//  DiscoverVC.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/29.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class DiscoverVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorV.setupVistorViewInfo(text: "有美人兮,见之不忘,一日不见兮,思之如狂", imgName: "visitordiscover_image_message")
        if !isLogin {
            return
        }
    }
    

}
