//  LiveViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/6/15.


import UIKit
import LFLiveKit

class LiveViewController: UIViewController {
    @IBOutlet weak var pushButton: UIButton!

    var session: LFLiveSession?
    override func viewDidLoad() {
        super.viewDidLoad()
        requestAccessForVideo()
        requestAccessForAudio()
    }

    private func requestAccessForVideo() {
        weak var weakSelf = self
        let status: AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.async(execute: {
                        weakSelf?.startSession()
                    })
                }
            }
        case .authorized:
            weakSelf?.startSession()
        case .denied, .restricted:
            break
        default:
            break
        }
    }
    
    private func requestAccessForAudio() {
            let status: AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .audio)
            switch status {
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .audio) { _ in }
            case .authorized:
                break
            case .denied, .restricted:
                break
            default:
                break
            }
    }

    private func startSession() {
        if (session == nil) {
            session = LFLiveSession(audioConfiguration: LFLiveAudioConfiguration.default(), videoConfiguration: LFLiveVideoConfiguration.default())
            session?.preView = view
        }
        session?.running = true
    }

    //onStart ボタン
    @IBAction func tapPush(_ sender: Any) {
        if (sender as AnyObject).currentTitle == "PUSH開始" {
            pushButton.setTitle("PUSH終了", for: .normal)
            let stream = LFLiveStreamInfo()
            stream.url = "rtmp://192.168.50.177:1935/zbcs/room"
            print("startPush\n")
            session?.startLive(stream)
        } else {
            print("stopPush\n")
            pushButton.setTitle("PUSH開始", for: .normal)
            session?.stopLive()
        }
    }

    //onBeaty ボタン
    @IBAction func tapBeaty(_ sender: Any) {
        session?.beautyFace = !session!.beautyFace
    }

    //onCameraChange ボタン
    @IBAction func changeCamera(_ sender: Any) {
        if session?.captureDevicePosition == .back {
            session?.captureDevicePosition = .front
        } else {
            session?.captureDevicePosition = .back
        }
    }
        
}
