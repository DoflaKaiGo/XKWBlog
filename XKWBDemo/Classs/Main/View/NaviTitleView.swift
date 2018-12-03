//
//  NaviTitleView.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/29.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class NaviTitleView: UIView {
    @IBOutlet weak var focusBtn: UIButton!
    @IBOutlet weak var titleArrowImg: UIImageView!
    @IBOutlet weak var hotBtn: UIButton!
    @IBOutlet weak var focusBottomLab: UILabel!
    @IBOutlet weak var hotBottomLab: UILabel!
    
    var  tapBtnCallback: ((_ tag:NSInteger,_ state:Bool) -> ())?
    var focusBtnState : Bool = true {
        didSet
        {
            if  focusBtnState {
                self.focusBottomLab.isHidden = false
            }else{
                    self.focusBottomLab.isHidden = true
            }
        }
    }
    
    var isShowCollectionV : Bool = false {
        didSet
        {
            if  isShowCollectionV {
                   focusBtnImageAnimation()
                print("显示下拉")
            }else{
            if oldValue{
                focusBtnImageAnimation()
                print("隐藏下拉")
                }
            }
        }
    }
    
    
    var hotBtnState : Bool = false {
        didSet
        {
            if  hotBtnState {
                self.hotBottomLab.isHidden = false
            }else{
                self.hotBottomLab.isHidden = true
            }
        }
    }
    
   
    class   func CreatV() -> NaviTitleView {
        let view = Bundle.main.loadNibNamed("NaviTitleView", owner: self, options: nil)?.first as? NaviTitleView
        if let view = view {
            view.sizeToFit()
            view.focusBtnState = true;
            view.hotBtnState = false;
            view.focusBottomLab.layer.cornerRadius = 2
            view.hotBottomLab.layer.cornerRadius = 2
            view.focusBottomLab.clipsToBounds = true
            view.hotBottomLab.clipsToBounds = true
            view.backgroundColor = UIColor.clear;
            return view
        }
        return UIView() as! NaviTitleView;
    }
    override func draw(_ rect: CGRect) {
        NotificationCenter.default.addObserver(self, selector: #selector(notitapPresentationControllerBlank), name: NSNotification.Name( "tapPresentationControllerBlank"), object: nil)

    }
   
    @objc private func notitapPresentationControllerBlank(){
        isShowCollectionV = false
    }
    //关注按钮动画
    private func focusBtnImageAnimation(){
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        if isShowCollectionV{
            animation.fromValue = 0
            animation.toValue = Float.pi
        }else{
            animation.fromValue = Float.pi
            animation.toValue = 0
        }
        animation.repeatCount = 1
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards;
        self.titleArrowImg.layer.add(animation, forKey: nil)
    }
    
    // 按钮点击事件
    @IBAction func tapFocusBtn(_ sender: UIButton) {
        if  self.focusBtnState == true {  self.isShowCollectionV = !self.isShowCollectionV}
        self.hotBtnState =  false
         self.focusBtnState = true
     
        sender.backgroundColor = UIColor.clear;
        if self.tapBtnCallback != nil {
            self.tapBtnCallback!(sender.tag,isShowCollectionV);
        }
    }
    
    @IBAction func tapHotBtn(_ sender: UIButton) {
        self.isShowCollectionV = false
        self.hotBtnState =  true
        self.focusBtnState = false
        sender.backgroundColor = UIColor.clear;
            if self.tapBtnCallback != nil {
               self.tapBtnCallback!(sender.tag,isShowCollectionV);
        }
    }
   
    deinit {
        NotificationCenter.default.removeObserver(self);
    }
}
