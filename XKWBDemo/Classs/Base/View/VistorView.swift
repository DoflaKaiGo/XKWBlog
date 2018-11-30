//
//  VistorView.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/30.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class VistorView: UIView {

    @IBOutlet weak var animationImg: UIImageView!
    @IBOutlet weak var vistorImg: UIImageView!
    @IBOutlet weak var vistorTitle: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!

    class func visitorView() -> VistorView {
        return Bundle.main.loadNibNamed("VistorView", owner: nil, options: nil)?.first as! VistorView
    }
    func setupVistorViewInfo(text:String,imgName:String)  {
        self.vistorTitle.text = text;
        self.vistorImg.image = UIImage(named: imgName)
        self.animationImg.isHidden = true
    }
    
    func setAnimation () {
        let baseAnimation  = CABasicAnimation(keyPath: "transform.rotation.z")
        baseAnimation.fromValue = 0
        baseAnimation.toValue = Double.pi * 2
        baseAnimation.duration = 5
        baseAnimation.isRemovedOnCompletion = false
        baseAnimation.repeatCount = MAXFLOAT
        self.animationImg.layer.add(baseAnimation, forKey: nil)
    }
}
