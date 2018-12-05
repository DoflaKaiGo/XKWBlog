//
//  BaseVC.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/30.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    var  isLogined : Bool  {
        get{
            return UserDefaults.standard.bool(forKey: isLogin)
        }
    }
    let visitorV = VistorView.visitorView();
    
    override func loadView() {
        isLogined ? super.loadView() : setupVisitorView()
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
        let request = WBAuthorizeRequest.request() as! WBAuthorizeRequest
        request.redirectURI = kRedirectURI
        request.scope = "all"
        request.userInfo = ["": ""]
        WeiboSDK.send(request)
          print("登录")
    }
}
