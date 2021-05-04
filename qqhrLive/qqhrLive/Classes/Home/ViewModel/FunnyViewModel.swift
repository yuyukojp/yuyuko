//
//  FunnyViewModel.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/4.
//

import UIKit

class FunnyViewModel: BaseViewModel {

}

extension FunnyViewModel {
    func loadFunnyData(finishedCallback: @escaping () -> ()) {
        loadAnchorData(isGroupData: false, URLString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/2", parameters: ["limit" : 30, "offset": 0], finishedCallback: finishedCallback)
    }
}
