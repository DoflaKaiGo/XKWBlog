//
//  CustomPresentController.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/30.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class CustomPresentController: UIPresentationController {
    var  presentVFrame : CGRect = CGRect.zero
    
    lazy private var coverView : UIView = {
        let coverV  = UIView()
        let gester = UITapGestureRecognizer(target: self, action: #selector(clickBlank))
        coverV.frame = containerView!.bounds
        coverV.backgroundColor = UIColor(white: 0.6, alpha: 0.4)
        coverV.addGestureRecognizer(gester)
        return coverV
    }()
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView?.frame = presentVFrame
        containerView!.insertSubview(coverView, at: 0)
    }
    
    @objc  private func clickBlank(){
        print("点击空白处")
        presentedViewController.dismiss(animated: true, completion: nil);
      //  NotificationCenter.default.post(name: NSNotification.Name(rawValue: "tapPresentationControllerBlank"), object: nil, userInfo: nil)
    //     NotificationCenter.default.post(name: NSNotification.Name(rawValue: "tapPresentationControllerBlank"), object: nil)
    }
}
