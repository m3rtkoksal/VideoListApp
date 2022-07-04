//
//  VideoPresenter.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import UIKit

class VideoPresenter: VideoModule.Presenter {
    
    var view: VideoModule.View?
    var interactor: VideoModule.Interactor!
    var router: VideoModule.Router!
    
    func fetchVideos() {
        interactor.fetchVideos()
    }
    
    func didFetch(videos: [VideoModel]) {
        view?.updateVideoList(videos.map({makeRowItem($0)}))
    }
    
    func didSelect(item video: VideoModule.VideoViewModel) {
        router.navigateToVideoDetail(video:video)
    }
}

extension VideoPresenter {
    
    func makeRowItem(_ item: VideoModel) -> VideoModule.VideoViewModel {
        .init(videoModel: .init(id: item.id, title: item.title, hlsURL: item.hlsURL, fullURL: item.fullURL, description: item.description, publishedAt: item.publishedAt, author: item.author))
    }
}
