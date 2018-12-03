//
//  PresentVC.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/30.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit

enum PresentVCType  {
    case table
    case collection
}

class PresentVC: UIViewController {
    @IBOutlet weak var grayBgView: UIView!
    static let  cellIdentifer = "customCell"
    let  textArray = ["写微博","发图片","拍视频","直播"];
    private let showType:PresentVCType;
    private  lazy var  layout  = setupCollectionViewLayout()
    private  lazy  var   collectionView : UICollectionView? = setupCollectionView()
    
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
    
    init(showType:PresentVCType){
          self .showType = showType
         super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   NotificationCenter.default.addObserver(self, selector: #selector(notitapPresentationControllerBlank), name: NSNotification.Name(rawValue: "tapPresentationControllerBlank"), object: nil)
      //  grayBgView.frame = CGRect(x: 0, y: ScreenInfo.navigationHeight, width: ScreenInfo.ScreenWidth, height: ScreenInfo.ScreenHeight - ScreenInfo.navigationHeight )
        if showType == PresentVCType.table {
            grayBgView.layer.cornerRadius = 10
            grayBgView.layer.masksToBounds = true
            grayBgView.addSubview(tableV)
        }else{
            grayBgView.backgroundColor = UIColor(red: 244/155.0, green: 244/155.0, blue: 244/155.0, alpha: 1)
            grayBgView.addSubview(collectionView!)
            print("点击titleView显示CollectionView");
        }
      
    }
    
//    @objc private func notitapPresentationControllerBlank(){
//        self.dismiss(animated: true, completion: nil)
//    }

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

// MArk: - CollectionView 代理方法
extension PresentVC :UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 5
        }
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FocusIteam = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusIteam", for: indexPath) as! FocusIteam
        return cell;
    }
    //点击 iteam
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: ScreenInfo.ScreenWidth, height: 40)
    }
    //设定header和footer的方法，根据kind不同进行不同的判断即可
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var  headV = UICollectionReusableView();
        if kind == UICollectionView.elementKindSectionHeader{
            if indexPath.section == 0{
                //1.取出section的headerView
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "kHeaderViewID", for: indexPath) as UICollectionReusableView
                let headerTitle = UILabel()
                headerTitle.frame = CGRect(x: 10, y: 5, width:100 , height: 40)
                headerTitle.text = "默认分组"
                let editingBtn = UIButton(type: .custom)
                editingBtn.frame = CGRect(x: ScreenInfo.ScreenWidth - 60, y: 10, width:50 , height: 40)
                editingBtn.setTitle("编辑", for: .normal)
                editingBtn.setTitleColor( UIColor.orange, for: .normal)
                headerView.addSubview(headerTitle)
                headerView.addSubview(editingBtn)
                headV = headerView
            }else{
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "kHeaderViewID2", for: indexPath) as UICollectionReusableView
                let headerTitle = UILabel()
                headerTitle.frame = CGRect(x: 10, y: 5, width:100 , height: 40)
                headerTitle.text = "我的分组"
                headerView.addSubview(headerTitle)
                headV = headerView
            }
        }
        return headV
    }
}
extension PresentVC {
private func setupCollectionViewLayout() -> UICollectionViewLayout{
    let layout = UICollectionViewFlowLayout.init()
    layout.itemSize = CGSize(width: ScreenInfo.ScreenWidth / 4 - 10 * 4, height: 40)
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    // 设置分区头视图和尾视图宽高
     layout.headerReferenceSize = CGSize.init(width: ScreenInfo.ScreenWidth, height: 40)
    // layout.footerReferenceSize = CGSize.init(width: ScreenInfo.ScreenWidth, height: 80)
    return layout
}
private func setupCollectionView() -> UICollectionView{
    let    collectionView = UICollectionView.init(frame: CGRect(x:0, y:0, width:ScreenInfo.ScreenWidth, height:ScreenInfo.ScreenHeight * 0.6), collectionViewLayout: layout)
    collectionView.backgroundColor = UIColor.white
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.showsHorizontalScrollIndicator = false
    // 注册cell
    collectionView.register(UINib.init(nibName: "FocusIteam", bundle: nil), forCellWithReuseIdentifier: "FocusIteam")
      // 注册 头部视图
    collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "kHeaderViewID")
      collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "kHeaderViewID2")
    
    collectionView.backgroundColor = UIColor(red: 250/255.0, green:  250/255.0, blue:  250/255.0, alpha: 1.0)
    let bgV = UIView()
    bgV.frame = CGRect(x: 0, y: 139, width: ScreenInfo.ScreenWidth, height: 1)
    bgV.backgroundColor = UIColor(red: 240/255.0, green:  240/255.0, blue:  240/255.0, alpha: 1.0)
    collectionView.addSubview(bgV)
    return collectionView
}
}
