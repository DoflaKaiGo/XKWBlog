//
//  WelcomeVC.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/12/7.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    let bgImgV = UIImageView(image: UIImage(named: "ad_background"))
    let headImgV = UIImageView()
    var userModel : UserInfoModel?
    
    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(bgImgV)
        view.addSubview(headImgV)
        headImgV.layer.cornerRadius = 35
        headImgV.layer.masksToBounds = true
        headImgV.frame = CGRect(x: ScreenInfo.ScreenWidth / 2 - 35, y: ScreenInfo.ScreenHeight - 150, width: 70, height: 70)
        requestUserData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5.0, options: [], animations: { () -> Void in
            self.headImgV.frame = CGRect(x: ScreenInfo.ScreenWidth / 2 - 35, y: 150, width: 70, height: 70)
        }) { (_) -> Void in
            // 3.将创建根控制器改成从Main.storyboard加载
            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    func requestUserData(){
        let access_token =  UserDefaults.standard.string(forKey: accessToken)
        let uid =  UserDefaults.standard.string(forKey: userID)
        NetworkTools.shareInstance.requestUserData(methodType: .GET, parameters: ["access_token":access_token as AnyObject,"uid":uid as AnyObject]) {[weak self](receiveUserModel, error) in
            if error != nil {return}
            self!.userModel = receiveUserModel
            self!.headImgV.af_setImage(withURL: URL(string: receiveUserModel!.userHeadImgUrl)! , placeholderImage: #imageLiteral(resourceName: "avatar_default_small"))
        }
    }
    override func viewWillLayoutSubviews() {
        bgImgV.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
