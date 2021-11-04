//
//  HttpTools.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/9/15.
//

import UIKit


class HttoTools {
    //MARK:- 闭包
    // (参数列表) -> (返回值类型)
    //@escaping 逃逸闭包
    func test(finishCallback: @escaping () -> ()) {
        //发送异步请求
        DispatchQueue.global().async {
            print("++++发送异步请求:打印线程\(Thread.current)")
            DispatchQueue.main.async {
                print("++++++回到主线程:打印线程\(Thread.current)")
                finishCallback()
            }
        }
    }
}
