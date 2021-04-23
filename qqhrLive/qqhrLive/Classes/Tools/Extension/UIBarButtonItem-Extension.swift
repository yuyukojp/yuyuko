//
//  UIBarButtonItem-Extension.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/5.
//

import UIKit

extension UIBarButtonItem {
    /* //构造类方法进行扩充
    class func createItem(imageName: String, highImageName: String, size: CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        //普通，高亮图片
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        return UIBarButtonItem(customView: btn)
        
    }
 */
    //扩充一个构造函数,在extension中只能构造便利构造函数： 1.必须以convenience开头；2.必须在构造函数中明确调用一个设计的构造函数用（self）进行调用
    //在参数后面加上= “” 空的字符串可以设置默认参数
    convenience init (imageName: String, highImageName: String = "", size: CGSize = CGSize.zero) {
        //创建uibutton
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        //对highlight,cgrect进行判断
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
       
        //第二个条件，创建uibarbuttonitem
        self.init(customView: btn)
        
    }
}
