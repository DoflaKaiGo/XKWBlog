//
//  MainViewHeadIeam.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/30.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class MainViewHeadIeam: UICollectionViewCell {
    @IBOutlet weak var headBgV: UIView!
    @IBOutlet weak var userHeadImg: UIImageView!
    @IBOutlet weak var userType: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func draw(_ rect: CGRect) {
        setupSubViews();
    }
    
    private func setupSubViews(){
        self.headBgV.layer.cornerRadius = 40
        self.headBgV.layer.borderColor = UIColor.orange.cgColor
        self.headBgV.layer.borderWidth = 2.0
        self.headBgV.clipsToBounds = true
        
        self.userHeadImg.layer.cornerRadius = 35
        self.userHeadImg.layer.masksToBounds = true
        self.userType.layer.cornerRadius = 10
        self.userType.layer.borderWidth = 2;
        self.userType.layer.borderColor = UIColor.white.cgColor
        self.userType.layer.masksToBounds = true
    }
}
