//
//  AmuseViewModel.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/3.
//

import UIKit

class AmuseViewModel {
    lazy var anchorGroups: [AnchorGroup] = [AnchorGroup]()
}

extension AmuseViewModel {
    func loadAmuseData(finishedCallback: @escaping () -> ()) {
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2") { (result) in
            //1.对结果进行处理
            guard let resultDict = result as? [String: Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String: Any]] else { return }
            //2.遍历字典
            for dict in dataArray {
                self.anchorGroups.append(AnchorGroup(dict: dict))
            }
            //3.回吊数据
            finishedCallback()
        }
    }
}
