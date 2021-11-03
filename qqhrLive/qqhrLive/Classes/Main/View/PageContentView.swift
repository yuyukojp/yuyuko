//
//  PageContentView.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/6.
//

import UIKit

protocol PageContentViewDelegate : AnyObject {
    func pageContentView(_ contentView : PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int)
}

private let ContentCellID = "ContentCellID"

class PageContentView: UIView {

    //定义属性
    private var childVcs : [UIViewController]
    private weak var parentViewController : UIViewController?
    //改成弱引用，否则会与homeviewcontrooler循环引用
    private var startOffsetX : CGFloat = 0
    private var isForbidScrollDelegate : Bool = false
    weak var delegate : PageContentViewDelegate?

    
    //懒加载属性
    private lazy var collectionView : UICollectionView = { [weak self] in //在闭包中self要用弱引用
        //1. 创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!  //view有多大itemsize就设置多大  加上括号强制解包 因为有可选类型？
        layout.minimumLineSpacing = 0   //设置行间距
        layout.minimumInteritemSpacing = 0  //iteam 间距
        layout.scrollDirection = .horizontal    //设置滚动方向
        
        //2.创建uicollectionview
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false //不限时水平滚动的指示器
        collectionView.isPagingEnabled = true   //分页限时
        collectionView.bounces = false   //不超出内容滚动区域
        collectionView.dataSource = self    //成为数据源
        collectionView.delegate = self
        collectionView.scrollsToTop = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)
        
        return collectionView
    }()
    
    //自定义构造函数
    init(frame: CGRect, childVcs: [UIViewController], parentViewController : UIViewController?) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
        //设置UI
        setuoUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//设置UI界面
extension PageContentView {
    private func setuoUI() {
        //1.将子控制器添加到父控制其中
        for childVc in childVcs {
            parentViewController?.addChild(childVc)
        }
        
        //2.添加uicollectionView,用于在Cell中存放控制器的View
        addSubview(collectionView)
        collectionView.frame = bounds
        
        
    }
}


//遵守uicollctionviewdatasource
extension PageContentView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1. 创建cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
        
        //2. 给cell设置内容
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
}

//遵守UICollectionViewDelegate
extension PageContentView : UICollectionViewDelegate {
   
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isForbidScrollDelegate = false
        
        startOffsetX = scrollView.contentOffset.x
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //0. 判断是否是点击事件
        if isForbidScrollDelegate { return }
        //1. 获取需要的数据progress 滚动的进度 需要判断滑动方向
        var progress : CGFloat = 0
        //2.sourceIndex
        var sourceIndex : Int = 0
        //3. targetIndex
        var targetIndex : Int = 0
        
        //判断滑动方向
        let currentOffsetX = scrollView.contentOffset.x
        let scrollVIewW = scrollView.bounds.width
        if currentOffsetX > startOffsetX {//左滑动
            //1.计算progress比例
            progress = currentOffsetX / scrollVIewW - floor(currentOffsetX / scrollVIewW)
            //2.计算sourceIndex
            sourceIndex = Int(currentOffsetX / scrollVIewW)
            //3. 计算targetIndex
            targetIndex = sourceIndex + 1
            //判断师傅越界
            if targetIndex >= childVcs.count {
                targetIndex = childVcs.count - 1
            }
            //4.如果完成滑动
            if currentOffsetX - startOffsetX == scrollVIewW{
                progress = 1
                targetIndex = sourceIndex
            }
        } else { //向右
            //1.计算progress比例
            progress = 1 - (currentOffsetX / scrollVIewW - floor(currentOffsetX / scrollVIewW))
            //2.计算targetIndex
            targetIndex = Int(currentOffsetX / scrollVIewW)
            //3. 计算sourceIndex
            sourceIndex = targetIndex + 1
            if sourceIndex >= childVcs.count {
                sourceIndex = childVcs.count - 1
            }
        }
        
        //3.将progress/sourceIndex/targetIndex传递给tittleView
        delegate?.pageContentView(self, progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
        
    }
}

//对外暴漏的方法
extension PageContentView {
    func setCurrentIndex(currentIndex : Int) {
        
        //记录禁止执行代理方法
        isForbidScrollDelegate = true
        
        //滚动到正确的位置
        let offsetX = CGFloat(currentIndex) * collectionView.frame.width
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
    
    }
}
