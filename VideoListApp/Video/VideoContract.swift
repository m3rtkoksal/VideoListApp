//
//  VideoContract.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import Foundation

protocol VideoModuleViewProtocol: AnyObject {
  var presenter: VideoModule.Presenter! { get set }
  
}

protocol VideoModuleInteractorProtocol: AnyObject {
  var presenter: VideoModule.Presenter? { get set }
  
  func fetchSeriesList()
}

protocol VideoModulePresenterProtocol: AnyObject {
  var view: VideoModule.View? { get set }
  var interactor: VideoModule.Interactor! { get set }
  var router: VideoModule.Router! { get set }

    func fetchVideos()
    func didFetch(videos: [VideoModule])
}

protocol VideoModuleRouterProtocol: AnyObject {
  
}

struct VideoModule {
  typealias View = VideoModuleViewProtocol
  typealias Interactor = VideoModuleInteractorProtocol
  typealias Presenter = VideoModulePresenterProtocol
  typealias Router = VideoModuleRouterProtocol
}
