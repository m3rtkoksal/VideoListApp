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
    var playerViewController = AVPlayerViewController()
    var player = AVPlayer()
    let markdownParser = MarkdownParser()
    var playPauseButton: PlayPauseButton!
    var nextButton: NextButton!
    var previousButton: PreviousButton!
    var presenter: VideoDetailModule.Presenter!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.prepareVideoDetail()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        playPauseButton.updateUI()
        nextButton.updateUI()
        previousButton.updateUI()
    }
    
    func updateView(item: VideoModule.VideoViewModel) {
       
        titleLabel.label(textStr: item.videoModel.title, textColor: .black, textFont: .systemFont(ofSize: 16), lineSpacing: -0.16, paragraphStyle: NSMutableParagraphStyle())
       
        let markdownParser = MarkdownParser()
        let markdown = item.videoModel.description
        descTextView.attributedText = markdownParser.parse(markdown)

        let videoURL = URL(string: item.videoModel.fullURL)
        self.player = AVPlayer(url: videoURL!)
        
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
        
        previousButton = PreviousButton()
        previousButton.avPlayer = player
        vmPlayer.addSubview(previousButton)
        previousButton.setup(in: self)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        playPauseButton.avPlayer?.pause()
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
