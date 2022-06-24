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
        interactor.fetchSeriesList()
    }
    
    func didFetch(videos: [VideoModule]) {
        
    }
}
