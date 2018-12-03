//
//  BaseNaviVC.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/29.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class BaseNaviVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
                self.tabBarItem.selectedImage = (self.tabBarItem.selectedImage!).withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                self.tabBarItem.image =   (self.tabBarItem.image!).withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
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
