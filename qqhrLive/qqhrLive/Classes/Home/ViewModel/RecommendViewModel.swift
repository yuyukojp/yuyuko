//
//  RecommendViewModel.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/4/18.
//

import UIKit

class RecommendViewModel {
    //MARK: 懒加载属性 存放数组
    private lazy var anchorGroups : [AncharGroup] = [AncharGroup] ()
    
}


//MARK: 发送网络请求
extension RecommendViewModel {
    func requestData() {
        //1. 请求推荐数据
        
        //2. 请求考研数据
        
        //3. 请求后面的数据
        
        //http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1618834174
        //print(NSDate.getCurrentTime())
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: ["limit": "4", "offset": "0", "time": NSDate.getCurrentTime() ]) { (resoult) in
            //1. 将resout转换成字典类型
            guard let resoultDict = resoult as? [String : NSObject] else { return }
            
            //2.根据data的KEY 获取数组
            guard let dataArray = resoultDict["data"] as? [[String : NSObject]] else { return }
            
            //3. 遍历数组 获取字典并且将它转换成膜性对象
            for dict in dataArray {
                let group = AncharGroup(dict: dict)
                self.anchorGroups.append(group)
            }
            
            for group in self.anchorGroups {
                for anchor in group.anchors {
                    print(anchor.nickname)
                }
                print("-------")
            }
        }
    }
}
