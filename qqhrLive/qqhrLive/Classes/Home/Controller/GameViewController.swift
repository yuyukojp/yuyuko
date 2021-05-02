//
//  GameViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/2.
//

import UIKit

private let kEdgeMargin : CGFloat = 10
private let kItemW: CGFloat = (kScreenW - 2 * kEdgeMargin) / 3
private let kItemH: CGFloat = kItemW * 6 / 5
//注册ID
private let kGameCellID = "kGameCellID"

class GameViewController: UIViewController {

    //MARK:- 懒加载属性

    fileprivate lazy var gameVM : GameViewModel = GameViewModel()
    
    fileprivate lazy var collectionView : UICollectionView = { [unowned self] in
        //1.创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize (width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        //2.创建collectionview
        //MARK: BBBBBBBADcollectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        //注册cell
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        //设置数据源
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        //collectionView.backgroundColor = UIColor.white
        
        return collectionView
        
    }()
    //MARK: 系统回吊
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupUI()
        loadData()

           
    }
    
}

//MARK:- 设置UI界面
extension GameViewController {
    fileprivate func setupUI() {
        view.addSubview(collectionView)
    }
}
//MARK:- 请求数据
extension GameViewController {
    

    fileprivate func loadData() {
        
        gameVM.loadAllGameData {
            self.collectionView.reloadData()

        }
     }
}


//MARK: 遵守UICollectionView的数据源&代理协议
extension GameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
        //return gameVM.games.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //获取cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        //MARK:-  BBBBBBBAD .70-71
        //print(gameVM.games)
        //let gameModel = gameVM.games[indexPath.item]
       // print(gameModel.tag_name)
        cell.backgroundColor = UIColor.randomColor()
        //cell.baseGame = gameVM.games[indexPath.item]
        
        return cell
    }
}

