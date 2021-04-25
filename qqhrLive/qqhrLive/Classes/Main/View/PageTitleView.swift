//
//  PageTitleView.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/6.
//

import UIKit

//定义代理协议
protocol PageTitleViewDelegate : class {
    func pageTitleVIew(titleView : PageTitleView, selectedIndex index : Int)
}

//定义常亮
private let kScrollLineH : CGFloat = 2
private let kNormalColor: (CGFloat,CGFloat,CGFloat) = (85,85,85)
private let kSelectColor: (CGFloat,CGFloat,CGFloat) = (225,123,153)

//定义PageTitleView类
class PageTitleView: UIView {

    //定义属性
    private var currentIndex : Int = 0
    private var titles: [String]
    //定义代理属性
    weak var delegate : PageTitleViewDelegate?
    
    //懒加载属性
    private lazy var titleLabels : [UILabel] = [UILabel]()
    private lazy var scrollView : UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    private lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.systemPink 
        return scrollLine
    }()
    //自定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        //设置UI界面
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



//设置子控件UI界面
extension PageTitleView {
    private func setupUI() {
        //1. 添加UIScrollVIew
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //2. 添加tiitle对应的Label
        setupTitleLabels()
        
        //3. 设置底线和滚动滑块
        setupBottomLineAndScrollLine()
    }
    
    private func setupTitleLabels() {
        
        //0.确定一些fram的值
        let labelW : CGFloat = frame.width/CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        //即拿到下标，又拿到title
        for (index,title) in titles.enumerated(){
            //1. 创建UILabel
            let label = UILabel()
            
            //设置设置label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
            label.textAlignment = .center
            
            //3. 设置label的frame
            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            //4. 将label 添加到scrollview中
            scrollView.addSubview(label)
            titleLabels.append(label)
            
            //5. 给Label添加手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(tapGes:)))
            label.addGestureRecognizer(tapGes)
            
        }
    }
    
    private func setupBottomLineAndScrollLine() {
        //1.添加底线
        let buttomLine = UIView()
        buttomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        buttomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(buttomLine)
        
        //2.添加scrollLine
        //2.1获取第一个label
        guard let firstLabel = titleLabels.first else {return}
        firstLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)   //将选中的文字颜色改变
        //2.2设置scrollLine的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScreenH)
        
        
    }
}

// 舰艇Label的点击
extension PageTitleView {
    //事件兼听监听需要加@objc
    @objc private func titleLabelClick(tapGes: UITapGestureRecognizer) {

        // 1. 获取当前label的下标值
        guard let currentLabel = tapGes.view as? UILabel else { return }
        //0. 重复点击同一个tittle直接返回
        if currentLabel.tag == currentIndex{return}
        //2. 获取之前的label
        let oldLeabel = titleLabels[currentIndex]
        
        //3.切换文字的颜色
        currentLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        oldLeabel.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        
        //4. 保存最新label的下标值
        currentIndex = currentLabel.tag
        //5. 滚动条位置发生改变
        let scrollLineX = CGFloat(currentIndex) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15) {
            self.scrollLine.frame.origin.x = scrollLineX
        }
        
        //6.统治代理
        delegate?.pageTitleVIew(titleView: self, selectedIndex: currentIndex)
    }
}

//对外暴露的方法
extension PageTitleView {
    func setTitleWithProgress(progress: CGFloat, sourseIndex: Int, targetIndex: Int) {
        //1. 取出sourceLabel/tagetLabel
        let sourceLabel = titleLabels[sourseIndex]
        let targetLabel = titleLabels[targetIndex]
        
        //2.处理滑块逻辑
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        //3. 颜色的渐变
        //3.1取出变化的范围
        let colorDelta = (kSelectColor.0 - kNormalColor.0, kSelectColor.1 - kNormalColor.1, kSelectColor.2 - kNormalColor.2)
        //3.2变化sourceLabel
        sourceLabel.textColor = UIColor(r: kSelectColor.0 - colorDelta.0 * progress, g: kSelectColor.1 - colorDelta.1 * progress, b: kSelectColor.2 - colorDelta.2 * progress)
        
        //3.3 变化tragetLabel
        targetLabel.textColor = UIColor(r: kNormalColor.0 + colorDelta.0 * progress, g: kNormalColor.1 + colorDelta.1 * progress, b: kNormalColor.2 + colorDelta.2 * progress)
        //4.记录最新的index
        currentIndex = targetIndex
    }
}
