//
//  GameViewModel.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/2.
//

import UIKit

class GameViewModel {
    lazy var games: [GameModel] = [GameModel]()

}
extension GameViewModel {
    func loadAllGameData(finishedCallback : @escaping () -> ()) {
        //MARK:- 数据太多 ;http://capi.douyucdn.cn/api/v1/getColumnDetail ; http://www.douyutv.com/api/v1/slide/6
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getColumnDetail",parameters: [ : ]) { (result) in
            //1.获取数据
            guard let resultDict = result as? [String: Any] else { return }
            //取出data
            guard let dataArray = resultDict["data"] as? [[String: Any]] else { return }
            //2. 字典转模型
            for dict in dataArray {
                self.games.append(GameModel(dict: dict))
            }
            //3.完成毁掉
            finishedCallback()
            
        }
    }
}
