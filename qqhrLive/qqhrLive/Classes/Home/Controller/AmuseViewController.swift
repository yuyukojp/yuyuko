//
//  AmuseViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/3.
//

import UIKit

class AmuseViewController: BaseAnchorViewController {
    //MARK:- 懒加载
    fileprivate lazy var amuseVM: AmuseViewModel = AmuseViewModel()

}

//MARK:- 请求数据
extension AmuseViewController {
    override func loadData() {
        //1. 给viewmodel复制
        baseVM = amuseVM
        //2. 请求数据
        
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
        }
    }
}
