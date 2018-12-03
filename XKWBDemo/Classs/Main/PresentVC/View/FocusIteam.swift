//
//  FocusIteam.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/12/3.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class FocusIteam: UICollectionViewCell {
    @IBOutlet weak var bgV: UIView!
    @IBOutlet weak var textLable: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    var isEditing = false {
        didSet{
            if  isEditing {
                deleteBtn.isHidden = false
            }else{
                deleteBtn.isHidden = true
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        bgV.layer.cornerRadius = 3
        bgV.layer.masksToBounds = true
        textLable.layer.cornerRadius = 3
        textLable.layer.masksToBounds = true
        if  isEditing {
            deleteBtn.isHidden = false
        }else{
            deleteBtn.isHidden = true
        }
    }

    @IBAction func clickDeleteBtn(_ sender: UIButton) {
    }
}
