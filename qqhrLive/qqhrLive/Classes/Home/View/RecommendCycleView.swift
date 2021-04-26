//
//  RecommendCycleView.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/24.
//

import UIKit

private let kCycleCellID = "kCycleCellID"

class RecommendCycleView: UIView {
    //MARK 定义属性
    var cycleTimer : Timer?
    var cycleModels : [CycleModel]? {
        didSet {
            //刷新collctionView
            collectionView.reloadData()
            //设置pageControll个数
            pageControl.numberOfPages = cycleModels?.count ?? 0
            
            //3.默认滚动到中间的某一个位置
            let indexPath = NSIndexPath(item: (cycleModels?.count ?? 0) * 1000, section: 0)
            collectionView.scrollToItem(at: indexPath as IndexPath, at: UICollectionView.ScrollPosition.centeredVertically, animated: false)
            //4. 添加定时器
            removeCycleTimer()
            addCycleTimer()
            
        }
    }
    //MARK: 设置控件
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: 系统调用空间
    override func awakeFromNib() {
        super.awakeFromNib()
        //设置不随着父控件拉伸
        //autoresizingMask = .None
        //注册cell
    
        collectionView.register(UINib(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kCycleCellID)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //设置collectionView的layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
    }
}
//MARk 提供一个快速创建的view方法
extension RecommendCycleView  {
    
    class func recommendCycleView() -> RecommendCycleView {
         return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}


//MARK: 遵守UICollectionView的数据源协议
extension RecommendCycleView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (cycleModels?.count ?? 0) * 910000
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath) as! CollectionCycleCell
        
        cell.cycleModel = cycleModels![indexPath.item % cycleModels!.count]
        
        //cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.yellow : UIColor.blue
        return cell
    }
    
}

//MARK:遵守UICollectionView的代理协议
extension RecommendCycleView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //1.获取滚动片月亮
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        //2.计算page
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % (cycleModels?.count ?? 1)
              
    }
    //3.监听用户的拖拽
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        addCycleTimer()
    }
}


//MARK： 对定时器的操作方法
extension RecommendCycleView {
    //添加定时器
    private func addCycleTimer() {
        cycleTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(self.scrolltoNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: RunLoop.Mode.common)
    }
    //删除定时器
    private func removeCycleTimer() {
        //从运行循环中移除
        cycleTimer?.invalidate()
        cycleTimer = nil
        
    }
    @objc private func scrolltoNext() {
        //1. 获取滚动的偏移量
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = currentOffsetX + collectionView.bounds.width
        
        //2. 滚动该位置
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        
    }
}
