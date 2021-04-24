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
        let parameters = ["limit": "4", "offset": "0", "time": NSDate.getCurrentTime() ]
        //1. 请求推荐数据
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time": NSDate.getCurrentTime()]) { (result) in
            //1. 将resout转换成字典类型
            guard let resoultDict = result as? [String : NSObject] else { return }
            
            //2.根据data的KEY 获取数组
            guard let dataArray = resoultDict["data"] as? [[String : NSObject]] else { return }
            
            //3. 遍历转换成模型对象
            //3.1创建组
            let group = AncharGroup()
            group.tag_name = "热门"
            group.icon_name = "home_header_hot"
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                group.anchors.append(anchor)
            }
            
        }
        //2. 请求考研数据
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters) { (result) in
            //1. 将resout转换成字典类型
            guard let resoultDict = result as? [String : NSObject] else { return }
            
            //2.根据data的KEY 获取数组
            guard let dataArray = resoultDict["data"] as? [[String : NSObject]] else { return }
            
            //3. 遍历转换成模型对象
            //3.1创建组
            let group = AncharGroup()
            group.tag_name = "颜值"
            group.icon_name = "home_header_phone"
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                group.anchors.append(anchor)
            }
            
        }
        
        //3. 请求后面的数据
        
        //http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1618834174
        //print(NSDate.getCurrentTime())
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) { (result) in
            //1. 将resout转换成字典类型
            guard let resoultDict = result as? [String : NSObject] else { return }
            
            //2.根据data的KEY 获取数组
            guard let dataArray = resoultDict["data"] as? [[String : NSObject]] else { return }
            
            //3. 遍历数组 获取字典并且将它转换成膜性对象
            for dict in dataArray {
                let group = AncharGroup(dict: dict)
                self.anchorGroups.append(group)
            }
            

        }
            //4. 判断是否所有的数据都请求到 isFUck code
       // dGroup.notify(queue: DispatchQueue.main) {
            
      //  }
    }
}
