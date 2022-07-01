//
//  VideoDetailViewController.swift
//  VideoListApp
//
//  Created by Mert Köksal on 27.06.2022.
//

import UIKit

class VideoDetailViewController: UIViewController {
    var selectedVideo: VideoModel!
    
    lazy var spinner: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        activityIndicator.color = UIColor.gray
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    
    
}
