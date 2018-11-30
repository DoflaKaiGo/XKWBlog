//
//  MainVC.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/29.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class MainVC: BaseVC {


    override func viewDidLoad() {
        super.viewDidLoad()
        setNavibarBtn();
        visitorV.setAnimation()
        if !isLogin {return}
        
    }
}

    //MARK: - UI设置
extension MainVC{
    //设置左右两边按钮,并使按钮图片保持原色  ** .withRenderingMode(.alwaysOriginal)
    private func setNavibarBtn(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:#imageLiteral(resourceName: "compose_toolbar_picture") .withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.done, target: self, action: #selector(clickLeftBtn));
        let rightBtnOne = UIBarButtonItem(image:#imageLiteral(resourceName: "tabbar_message_center_highlighted") .withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.done, target: self, action: #selector(clickRightOneBtn));
        let rightBtnTwo = UIBarButtonItem(image:#imageLiteral(resourceName: "navigationbar_pop_highlighted") .withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.done, target: self, action: #selector(clickRightTwoBtn));
        self.navigationItem.rightBarButtonItems = [rightBtnOne,rightBtnTwo];
        setNaviTitleView();
    }
    
    private func setNaviTitleView(){
        let  naviTitleV = NaviTitleView.CreatV()
        naviTitleV.tapBtnCallback =   {( tag : NSInteger , state : Bool ) in
            if tag == 0 {
                print("点击了 关注 按钮")
            }else{
                print("点击了 热门 按钮")
            }
        }
        let view = UIView();
        view.frame = CGRect(x: 0, y: 0, width: 145, height: 40)
        view.addSubview(naviTitleV)
        self.navigationItem.titleView = view
    }
}

    //MARK: - 按钮点击事件
extension MainVC{

    @objc func clickLeftBtn(){
        print("点击了左边按钮")
    }
    @objc func clickRightOneBtn(){
        print("点击了右边第一个按钮")
    }
    @objc func clickRightTwoBtn(){
        print("点击了右边第二个按钮")
    }
}
