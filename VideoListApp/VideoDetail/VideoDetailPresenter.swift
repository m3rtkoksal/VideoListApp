//
//  VideoDetailPresenter.swift
//  VideoListApp
//
//  Created by Mert Köksal on 1.07.2022.
//

import Foundation

class VideoDetailPresenter: VideoDetailModule.Presenter {
    
    var view: VideoDetailModule.View?
    var interactor: VideoDetailModule.Interactor!
    var router: VideoDetailModule.Router!

    func prepareVideoDetail() {
        interactor.fetchVideoDetail()
    }
    
    func didFetchedVideoDetail(_ item: VideoModule.VideoViewModel) {
        view?.updateView(item: item)
    }
}
