//
//  AVView.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/5/1.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        VStack {
            player().frame(height: UIScreen.main.bounds.height / 3)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct player : UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let url = "https://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4"
        let player1 = AVPlayer(url: URL(string: url)!)
        controller.player = player1
        return controller
    }
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {
        
    }
}

