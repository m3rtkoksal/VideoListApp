//
//  VideoDetailContract.swift
//  VideoListApp
//
//  Created by Mert Köksal on 1.07.2022.
//

import Foundation

protocol VideoDetailModuleViewProtocol: AnyObject {
    var presenter: VideoDetailModule.Presenter! { get set }
    
    func updateView(item: VideoModule.VideoViewModel)
}

protocol VideoDetailModuleInteractorProtocol: AnyObject {
    var presenter: VideoDetailModule.Presenter? { get set }
    var videoItem: VideoModule.VideoViewModel { get set }
    
    func fetchVideoDetail()
}

protocol VideoDetailModulePresenterProtocol: AnyObject {
    var view: VideoDetailModule.View? { get set }
    var interactor: VideoDetailModule.Interactor! { get set }
    var router: VideoDetailModule.Router! { get set }
    
    func prepareVideoDetail()
    func didFetchedVideoDetail(_ item: VideoModule.VideoViewModel)
}

protocol VideoDetailModuleRouterProtocol: AnyObject {
    
}

struct VideoDetailModule {
    typealias View = VideoDetailModuleViewProtocol
    typealias Interactor = VideoDetailModuleInteractorProtocol
    typealias Presenter = VideoDetailModulePresenterProtocol
    typealias Router = VideoDetailModuleRouterProtocol
}

extension VideoDetailModule {
    
    struct VideoDetailModuleViewModel {
        var videoModel: VideoModel
    }
}
