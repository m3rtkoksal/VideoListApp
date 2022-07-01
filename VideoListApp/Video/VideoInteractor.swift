//
//  VideoInteractor.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import Foundation

class VideoInteractor: VideoModule.Interactor {
    
    var presenter: VideoModule.Presenter?
    
    func fetchVideos() {
        VideoListNetworkManager.shared.providerVideo { [weak self] video in
            self?.presenter?.didFetch(videos: video ?? [])
        }
    }
}
