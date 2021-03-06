//
//  MainVC.swift
//  XKWBDemo
//
//  Created by Lxk on 2018/11/29.
//  Copyright © 2018年 Lxk. All rights reserved.
//

import UIKit
class MainVC: BaseVC {
    // MArk: - 懒加载
    private var wbdataModelArray  = [WBDataInfoModel]()
    private  var publishBtnSelected : Bool = false // 发布按钮的点击状态
    private lazy var  presentAnimationor  : PresentAnimationor = PresentAnimationor()
    lazy  var  publishPresentVC = PresentVC(showType: PresentVCType.table) //发布按钮弹窗
    lazy  var  focusPresentVC = PresentVC(showType: PresentVCType.collection) //关注按钮弹窗
    private  lazy var  layout  = setupCollectionViewLayout()
   private  lazy  var   collectionView : UICollectionView? = setupCollectionView()
   private  lazy var tableView: UITableView? = setupTableView()
    private let  netManager = NetworkTools.shareInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        visitorV.setAnimation()
        if !isLogined {return}
           setNavibarBtn();
         view.addSubview(tableView!);
        requestData()
    }
    
    func requestData() {
      let   token = UserDefaults.standard.string(forKey: accessToken)
        netManager.requestWBData(methodType: .GET, parameters: ["access_token":token as AnyObject]) {[weak self] (data, error) in
            self!.wbdataModelArray = data as! [WBDataInfoModel]
            self!.tableView?.reloadData()
            if error != nil{print(data as Any)}
        }
    }
    
     func reloadView() {
        if !isLogined {return}
        setNavibarBtn();
        view.addSubview(tableView!);
    }
}

    //MARK: - UI设置
extension MainVC{
    //设置左右两边按钮,并使按钮图片保持原色  ** .withRenderingMode(.alwaysOriginal)
    private func setNavibarBtn(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:#imageLiteral(resourceName: "compose_toolbar_picture") .withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.done, target: self, action: #selector(clickLeftBtn));
        let rightBtnOne = UIBarButtonItem(image:#imageLiteral(resourceName: "tabbar_compose_icon_add_highlighted") .withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.done, target: self, action: #selector(clickRightOneBtn));
        let rightBtnTwo = UIBarButtonItem(image:#imageLiteral(resourceName: "tabbar_message_center_highlighted") .withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.done, target: self, action: #selector(clickRightTwoBtn));
        self.navigationItem.rightBarButtonItems = [rightBtnOne,rightBtnTwo];
        setNaviTitleView();
    }
    private func setNaviTitleView(){
        let  naviTitleV = NaviTitleView.CreatV()
        naviTitleV.tapBtnCallback =   {[weak self]( tag : NSInteger , state : Bool ) in
            if tag == 0 {
                if(state){
                self!.focusPresentVC.modalPresentationStyle = .custom
                self!.focusPresentVC.transitioningDelegate = self!.presentAnimationor
                self!.presentAnimationor.presentVCFrame = CGRect(x: 0, y: 0, width: ScreenInfo.ScreenWidth, height: ScreenInfo.ScreenHeight * 0.6);
                //弹出选项列表
               self!.present(self!.focusPresentVC, animated: true, completion: nil);
                print("点击了 关注 按钮")
                }else{
                      self!.focusPresentVC.dismiss(animated: true, completion: nil)
                }
            }else{
                  self!.focusPresentVC.dismiss(animated: true, completion: nil)
                print("点击了 热门 按钮")
            }
        }
        let view = UIView();
        view.frame = CGRect(x: 0, y: 0, width: 145, height: 40)
        view.addSubview(naviTitleV)
        self.navigationItem.titleView = view
    }
}

// MArk: - CollectionView 的代理方法
extension MainVC :UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell:MainViewHeadIeam = collectionView.dequeueReusableCell(withReuseIdentifier: mainViewHeadCollectionCell, for: indexPath) as! MainViewHeadIeam
        return cell;
    }
    //点击 iteam
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

// MArk: - UITableView 的代理方法
extension MainVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wbdataModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var   cell :UITableViewCell;
         let wbDataModel = wbdataModelArray[indexPath.row]
        if  (wbDataModel.imagesUrl?.count)! == 0 {
            cell =  tableView.dequeueReusableCell(withIdentifier: originalTextCell, for: indexPath) as! WBOriginalOnlyTextCell
        }else  if (wbDataModel.imagesUrl?.count)! <= 3 && (wbDataModel.imagesUrl?.count)! > 1 {
              cell =    tableView.dequeueReusableCell(withIdentifier: originalThreeImgCell, for: indexPath)
        }else  if (wbDataModel.imagesUrl?.count)! <= 6 && (wbDataModel.imagesUrl?.count)! > 3{
            cell =    tableView.dequeueReusableCell(withIdentifier: originalSixImgCell, for: indexPath)
        }else if (wbDataModel.imagesUrl?.count)! <= 9 && (wbDataModel.imagesUrl?.count)! > 6{
            cell =    tableView.dequeueReusableCell(withIdentifier: originalNineImgCell, for: indexPath)
        }else if (wbDataModel.imagesUrl?.count)! == 1{
            cell =    tableView.dequeueReusableCell(withIdentifier: originalOneImgCell, for: indexPath)
        }else{
            cell =    tableView.dequeueReusableCell(withIdentifier: originalVideCell, for: indexPath)
        }
          cell.setWBDataWithModel(model:wbDataModel )
//        if indexPath.row % 4 == 1 {
//          cell =  tableView.dequeueReusableCell(withIdentifier: originalVideCell, for: indexPath)
//        }else if indexPath.row % 4 == 2{
//
//        }else if indexPath.row % 4 == 3{
//            cell =    tableView.dequeueReusableCell(withIdentifier: originalThreeImgCell, for: indexPath)
//        }else{
//              cell =    tableView.dequeueReusableCell(withIdentifier: originalOneImgCell, for: indexPath)
//        }
            cell.selectionStyle = .none
        return cell
    }
}

    //MARK: - 按钮点击事件
extension MainVC{
    @objc func clickLeftBtn(){
        print("点击了左边按钮")
    }
    @objc func clickRightOneBtn(){
        publishBtnSelected = !publishBtnSelected
        publishPresentVC.modalPresentationStyle = .custom
        publishPresentVC.transitioningDelegate = presentAnimationor
        presentAnimationor.presentVCFrame = CGRect(x: ScreenInfo.ScreenWidth - 145, y: ScreenInfo.navigationHeight + 10, width: 140, height: 180);
        //弹出选项列表
        present(publishPresentVC, animated: true, completion: nil);
    }
    @objc func clickRightTwoBtn(){
        print("点击了右边第二个按钮")
    }
}

// lazy UI Func
extension MainVC {
    private func setupCollectionViewLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: (ScreenInfo.ScreenWidth - 60)/5, height: 100)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 5, bottom: 0, right: 5)
        // 设置分区头视图和尾视图宽高
        // layout.headerReferenceSize = CGSize.init(width: ScreenInfo.ScreenWidth, height: 80)
        // layout.footerReferenceSize = CGSize.init(width: ScreenInfo.ScreenWidth, height: 80)
        return layout
    }
    private func setupCollectionView() -> UICollectionView{
        let    collectionView = UICollectionView.init(frame: CGRect(x:0, y:0, width:ScreenInfo.ScreenWidth, height:140), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        // 注册cell
        collectionView.register(UINib.init(nibName: "MainViewHeadIeam", bundle: nil), forCellWithReuseIdentifier: mainViewHeadCollectionCell)
        collectionView.backgroundColor = UIColor(red: 250/255.0, green:  250/255.0, blue:  250/255.0, alpha: 1.0)
        let bgV = UIView()
        bgV.frame = CGRect(x: 0, y: 139, width: ScreenInfo.ScreenWidth, height: 1)
        bgV.backgroundColor = UIColor(red: 240/255.0, green:  240/255.0, blue:  240/255.0, alpha: 1.0)
        collectionView.addSubview(bgV)
        return collectionView
    }
    
       private func setupTableView() -> UITableView{
        let tableView = UITableView (frame: CGRect(x: 0, y: 0, width: ScreenInfo.ScreenWidth, height: ScreenInfo.ScreenHeight - 49 - ScreenInfo.navigationHeight), style:.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableHeaderView = collectionView
        tableView.separatorStyle = .none
        tableView.register(UINib.init(nibName: originalVideCell, bundle: nil), forCellReuseIdentifier: originalVideCell)
        tableView.register(WBOriginalOnlyTextCell.self, forCellReuseIdentifier: originalTextCell)
        tableView.register(WBOriginalOneImageCell.self, forCellReuseIdentifier: originalOneImgCell)
        tableView.register(WBOriginalThreeImgCell.self, forCellReuseIdentifier: originalThreeImgCell)
         tableView.register(WBOriginalSixImgCell.self, forCellReuseIdentifier: originalSixImgCell)
        tableView.register(WBOriginalNineImgCell.self, forCellReuseIdentifier: originalNineImgCell)

        return tableView
    }
}
