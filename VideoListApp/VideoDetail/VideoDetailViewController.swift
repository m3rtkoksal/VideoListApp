//
//  VideoDetailViewController.swift
//  VideoListApp
//
//  Created by Mert Köksal on 1.07.2022.
//

import UIKit
import AVKit
import AVFoundation

class VideoDetailViewController: UIViewController, VideoDetailModule.View {
    
    @IBOutlet weak var vmPlayer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var presenter: VideoDetailModule.Presenter!
    var player: AVPlayer!
    var playerViewController: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.prepareVideoDetail()
    }
    
    func updateView(item: VideoModule.VideoViewModel) {
        titleLabel.text = item.videoModel.title
        
        let videoURL = URL(string: item.videoModel.fullURL)
        self.player = AVPlayer(url: videoURL!)
        self.playerViewController = AVPlayerViewController()
        playerViewController.player = self.player
        playerViewController.view.frame = self.vmPlayer.frame
        playerViewController.player?.pause()
        self.vmPlayer.addSubview(playerViewController.view)
    }

}
