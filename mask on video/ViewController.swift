//
//  ViewController.swift
//  mask on video
//
//  Created by Ting on 2022/1/30.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        //加入攝影機圖片
        let cinemaImage = UIImage(named: "cinema.png")
        let cinemaImageView = UIImageView(image: cinemaImage)
        //設定攝影機圖片大小
        cinemaImageView.frame.size = CGSize(width: 800, height: 425)
        //設定影像的位置和大小
        let videoView = UIView(frame: CGRect(origin: CGPoint(x: -10, y: -25), size: cinemaImageView.frame.size))
        //videoView用來裝呈現影片的layer，cinemaImageView會當作videoView的mask
            view.addSubview(videoView)
        //加入影片的URL
        let url = URL(string: "http://movietrailers.apple.com/movies/wb/madmaxfuryroad/madmax-tlr3_h1080p.mov")
        let player = AVPlayer(url: url!)
        //顯示到畫面上需要型別AVPlayerLayer的playerLayer
        //如果只有player，我們只能聽到聲音
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(origin: .zero, size: cinemaImageView.frame.size)
        //.resizeAspectFill讓影片佔滿playerLayer的長方形框框
        playerLayer.videoGravity = .resizeAspectFill
        //將顯示影片的playerLayer加到videoView上
        videoView.layer.addSublayer(playerLayer)
        //videoView原本是長方形，透過設定mask為cinemaImageView，讓videoView切成攝影機形狀
        videoView.mask = cinemaImageView
        //播放
        player.play()
        }
    }




