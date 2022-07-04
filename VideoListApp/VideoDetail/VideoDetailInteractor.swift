//
//  VideoDetailInteractor.swift
//  VideoListApp
//
//  Created by Mert Köksal on 1.07.2022.
//

import Foundation

class VideoDetailInteractor: VideoDetailModule.Interactor {
    
    var presenter: VideoDetailModule.Presenter?
    var videoItem: VideoModule.VideoViewModel
    
    init(videoItem: VideoModule.VideoViewModel) {
        self.videoItem = videoItem
    }
    
    func fetchVideoDetail() {
        presenter?.didFetchedVideoDetail(videoItem)
    }
    
}
