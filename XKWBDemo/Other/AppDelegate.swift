//
//  AppDelegate.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/29.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,WeiboSDKDelegate {

    var window: UIWindow?
    //APPKEY : 761252307

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        WeiboSDK.enableDebugMode(true)
        WeiboSDK.registerApp(AppKey)
        return true
    }
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return WeiboSDK.handleOpen(url, delegate: self )
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return WeiboSDK.handleOpen(url, delegate:self)
    }
    
    func didReceiveWeiboRequest(_ request: WBBaseRequest!) {
    }
    //微博的回应
    func didReceiveWeiboResponse(_ response: WBBaseResponse!) {
        if response is WBAuthorizeResponse {
            if (response.statusCode == WeiboSDKResponseStatusCode.success) {
                let authorizeResponse : WBAuthorizeResponse = response as! WBAuthorizeResponse
                let userId = authorizeResponse.userID
                let accesstoken = authorizeResponse.accessToken
               let  userInfo = response.userInfo as Dictionary
                let time = authorizeResponse.expirationDate
                 UserDefaults.standard.set(true, forKey: isLogin)
                 UserDefaults.standard.set(userId, forKey: userID)
                  UserDefaults.standard.set(time, forKey: experiateDate)
                 UserDefaults.standard.set(accesstoken, forKey: accessToken)
                print(userInfo)
            }
        }
    }
}

