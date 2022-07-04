//
//  VideoDetailViewController.swift
//  VideoListApp
//
//  Created by Mert Köksal on 1.07.2022.
//

import UIKit
import AVKit
import AVFoundation
import MarkdownKit

class VideoDetailViewController: UIViewController, VideoDetailModule.View {
    
    @IBOutlet weak var vmPlayer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    let markdownParser = MarkdownParser()
    var playPauseButton: PlayPauseButton!
    var nextButton: NextButton!
    var presenter: VideoDetailModule.Presenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.prepareVideoDetail()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        playPauseButton.updateUI()
        nextButton.updateUI()
    }
    
    func updateView(item: VideoModule.VideoViewModel) {
        titleLabel.label(textStr: item.videoModel.title, textColor: .black, textFont: .systemFont(ofSize: 16), lineSpacing: -0.16, paragraphStyle: NSMutableParagraphStyle())
        descTextView.text = item.videoModel.description
        
        let playerViewController = AVPlayerViewController()
        let videoURL = URL(string: item.videoModel.fullURL)
        let player = AVPlayer(url: videoURL!)
        
        player.rate = 1 //auto play
        playerViewController.player = player
        playerViewController.view.frame = self.vmPlayer.frame
//        playerViewController.player?.pause()
        playerViewController.showsPlaybackControls = false
        addChild(playerViewController)
        vmPlayer.addSubview(playerViewController.view)
        playerViewController.didMove(toParent: self)
        
        playPauseButton = PlayPauseButton()
        playPauseButton.avPlayer = player
        vmPlayer.addSubview(playPauseButton)
        playPauseButton.setup(in: self)
        
        nextButton = NextButton()
        nextButton.avPlayer = player
        vmPlayer.addSubview(nextButton)
        nextButton.setup(in: self)
    }
    
}
