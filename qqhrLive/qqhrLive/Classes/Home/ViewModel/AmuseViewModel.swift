//
//  AmuseViewModel.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/3.
//

import UIKit

class AmuseViewModel: BaseViewModel {
   // lazy var anchorGroups: [AnchorGroup] = [AnchorGroup]()
}

extension AmuseViewModel {
    func loadAmuseData(finishedCallback: @escaping () -> ()) {
        loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", finishedCallback: finishedCallback)
    
    }
}
