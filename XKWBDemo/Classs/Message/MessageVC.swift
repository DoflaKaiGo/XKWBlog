//
//  MessageVC.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/29.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class MessageVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        visitorV.setupVistorViewInfo(text: "二十四桥明月夜,玉人何处教吹箫", imgName: "visitordiscover_image_message")
        if !isLogin {
            return
        }
    }
    


}
