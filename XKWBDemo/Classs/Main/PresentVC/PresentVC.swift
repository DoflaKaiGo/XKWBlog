//
//  PresentVC.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/30.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

class PresentVC: UIViewController {
    @IBOutlet weak var grayBgView: UIView!
    static let  cellIdentifer = "customCell"
    let  textArray = ["写微博","发图片","拍视频","直播"];
    
    lazy private var tableV : UITableView = {
        let tableV = UITableView(frame: CGRect(x: 0, y: 0, width: 130, height: 180), style: .plain)
        tableV.delegate = self
        tableV.dataSource = self
        tableV.estimatedRowHeight = 40
        tableV.rowHeight = UITableView.automaticDimension
        tableV.bounces = false
        tableV.backgroundColor = UIColor.clear
        tableV.separatorColor = UIColor(white: 0.5, alpha: 0.5)
        tableV.register(UINib.init(nibName: "RightCustomCell", bundle: nil), forCellReuseIdentifier: PresentVC.cellIdentifer)
        return tableV
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
   //     NotificationCenter.default.addObserver(self, selector: #selector(notitapPresentationControllerBlank), name: NSNotification.Name(rawValue: "tapPresentationControllerBlank"), object: nil)
        grayBgView.layer.cornerRadius = 10
        grayBgView.layer.masksToBounds = true
        grayBgView.addSubview(tableV)
    }
    
//    @objc private func notitapPresentationControllerBlank(){
//        self.dismiss(animated: true, completion: nil)
//    }
//
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension PresentVC : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:PresentVC.cellIdentifer , for: indexPath) as! RightCustomCell
        cell.selectionStyle = .none
        cell.iteamTitle.text = textArray[indexPath.row]
        return cell
    }
}
