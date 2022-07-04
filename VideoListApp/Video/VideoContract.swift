//
//  VideoContract.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import Foundation

protocol VideoModuleViewProtocol: AnyObject {
  var presenter: VideoModule.Presenter! { get set }
  
  func updateVideoList(_ items: [VideoModule.VideoViewModel])
}

protocol VideoModuleInteractorProtocol: AnyObject {
  var presenter: VideoModule.Presenter? { get set }
  
  func fetchVideos()
}

protocol VideoModulePresenterProtocol: AnyObject {
  var view: VideoModule.View? { get set }
  var interactor: VideoModule.Interactor! { get set }
  var router: VideoModule.Router! { get set }

    func fetchVideos()
    func didFetch(videos: [VideoModel])
    func didSelect(item video: VideoModule.VideoViewModel)
}

protocol VideoModuleRouterProtocol: AnyObject {
    func navigateToVideoDetail(video: VideoModule.VideoViewModel)
}

struct VideoModule {
  typealias View = VideoModuleViewProtocol
  typealias Interactor = VideoModuleInteractorProtocol
  typealias Presenter = VideoModulePresenterProtocol
  typealias Router = VideoModuleRouterProtocol
}

extension VideoModule {
    
    struct VideoViewModel {
        var videoModel: VideoModel
    }
}
