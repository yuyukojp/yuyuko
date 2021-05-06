//
//  BaseAnchorViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/4.
//

import UIKit
import AVKit

private let kItemMargin : CGFloat = 10
let kNormalItemH = kNormalItemW * 3 / 4
let kPrettyItemH = kNormalItemW * 4 / 3
private let kHeaderViewH : CGFloat = 50
let kNormalItemW = (kScreenW - 3 * kItemMargin) / 2
var playerController = AVPlayerViewController()

private let kNormalCellID = "kNormalCellID"
let kPrettyCellID = "kPrettyCellID"
private let kHeaderViewID = "kHeaderViewID"

class BaseAnchorViewController: BaseViewController {

    //MARK:- 定义属性
    var baseVM: BaseViewModel!
    lazy var collectionView : UICollectionView = { [unowned self] in
         //1. 创建布局
         let layout = UICollectionViewFlowLayout()
         layout.itemSize = CGSize(width: kNormalItemW, height: kNormalItemH)
         layout.minimumLineSpacing = 0
         layout.minimumInteritemSpacing = kItemMargin
         layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
         //设置内边距
         layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
         //2.创建UIcollectionview
         let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
         
         collectionView.backgroundColor = UIColor.white
         collectionView.dataSource = self
         collectionView.delegate = self
         //高度和宽度随着副控件变化
         collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
         //注册cell
         //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
         collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
         collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
         //注册组头
         collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
         collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
         
         return collectionView
     }()
    
    //MARK:- 系统徽调
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }
    
}

//MARK:- 设置UI
extension BaseAnchorViewController {
    @objc override func setupUI() {
        contentView = collectionView        
        view.addSubview(collectionView)
        super.setupUI()
    }
    
 
}
//MARK:- 请求数据
extension BaseAnchorViewController {
    @objc func loadData() {
  
    }
}

//MARK:- 遵守uivollcetiom的协议

extension BaseAnchorViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
     
        return baseVM.anchorGroups.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        
        return baseVM.anchorGroups[section].anchors.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1.取出cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
       
        //2.给cell数据
        cell.anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //1.取出headerview
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
       
        //2.给header设置数据
        headerView.group = baseVM.anchorGroups[indexPath.section]
        
        return headerView
        
    }
}

//MARK:- 遵守uicollectionview的代理协议
extension BaseAnchorViewController: UICollectionViewDelegate,AVPlayerViewControllerDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //1.取出主播信息
        let anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
        //2.判断是手机还是普通
        anchor.isVertical == 0 ? pushNormalRoomVc(): presentShowRoomVc()
    }
    private func presentShowRoomVc() {
        //1.创建showroomvx
        guard let url = URL(string: "https://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4") else { return }
        let player = AVPlayer(url: url)
        
        //2.以model方式弹出      
    
        playerController = AVPlayerViewController()
        playerController.player = player
        playerController.allowsPictureInPicturePlayback = true
        playerController.delegate = self
        playerController.player?.play()
        navigationController?.pushViewController(playerController, animated: true)
    }
    private func pushNormalRoomVc() {
        //let normalRoomVc = RoomNormalViewController()
       // navigationController?.pushViewController(normalRoomVc, animated: true)
        guard let url = URL(string: "https://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4") else { return }
        
        let player = AVPlayer(url: url)
        playerController = AVPlayerViewController()
        playerController.player = player
        playerController.allowsPictureInPicturePlayback = true
        playerController.delegate = self
        playerController.player?.play()
        
        self.present(playerController, animated: true, completion: nil)
        
    }
}
