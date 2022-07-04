//
//  VideoRouter.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import UIKit

class VideoRouter: VideoModule.Router{
    
    weak var presenterVC: UIViewController?
    
    func navigateToVideoDetail(video: VideoModule.VideoViewModel) {
        let vc = VideoDetailModule.createModule(videoItem: video)
        presenterVC?.hidesBottomBarWhenPushed = true
        presenterVC?.navigationController?.pushViewController(vc, animated: true)
        presenterVC?.hidesBottomBarWhenPushed = false
    }
}
