//
//  RoomNormalViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/4.
//

import UIKit
import AVKit

class RoomNormalViewController: UIViewController, AVPlayerViewControllerDelegate, UIGestureRecognizerDelegate {
    var playerController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //view.backgroundColor = UIColor.yellow
      /*  guard let url = URL(string: "https://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4") else { return }
        
        let player = AVPlayer(url: url)
        playerController = AVPlayerViewController()
        playerController.player = player
        playerController.allowsPictureInPicturePlayback = true
        playerController.delegate = self
        playerController.player?.play()
        
        self.present(playerController, animated: true, completion: nil)*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /*//隐藏导航栏
        navigationController?.setNavigationBarHidden(true, animated: true)
        //保持收拾
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        */
    }
  /*  override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    */
}

