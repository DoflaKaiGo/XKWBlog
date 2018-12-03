//
//  BaseVC.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/30.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    let isLogin = true
    let visitorV = VistorView.visitorView();
    
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupVisitorView(){
        view = visitorV;
        visitorV.registerBtn.addTarget(nil, action: #selector(clickRejesterBtn), for: .touchUpInside)
        visitorV.loginBtn.addTarget(nil, action: #selector(clickLoginBtn), for: .touchUpInside)

    }

    @objc func clickRejesterBtn(){
        print("注册")
    }
    @objc func clickLoginBtn(){
          print("登录")
    }

}
