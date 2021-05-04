//
//  AmuseViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/3.
//

import UIKit
private let kMenuViewH : CGFloat = 200

class AmuseViewController: BaseAnchorViewController {
    //MARK:- 懒加载
    fileprivate lazy var amuseVM: AmuseViewModel = AmuseViewModel()
    /*fileprivate lazy var menuView: AmuseMenuView = {
        let menuView = AmuseMenuView.amuseMenuView()
        menuView.frame = CGRect(x: 0, y: -kMenuViewH, width: kScreenW, height: kMenuViewH)
        menuView.backgroundColor = UIColor.red
        return menuView
    }()*/

}
/*
//MARK:- 设置ui界面
extension AmuseViewController {
    override func setupUI() {
        super.setupUI()
        collectionView.addSubview(menuView)
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)
    }
}*/

//MARK:- 请求数据
extension AmuseViewController {
    override func loadData() {
        //1. 给viewmodel复制
        baseVM = amuseVM
        //2. 请求数据
        
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
            //3.请求数据完成
            self.loadDataFinished()
        }
    }
}

