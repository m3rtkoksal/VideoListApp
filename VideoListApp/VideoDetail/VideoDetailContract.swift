//
//  VideoDetailContract.swift
//  VideoListApp
//
//  Created by Mert Köksal on 1.07.2022.
//

import Foundation

protocol VideoDetailModuleViewProtocol: AnyObject {
    var presenter: VideoDetailModule.Presenter! { get set }
    
}

protocol VideoDetailModuleInteractorProtocol: AnyObject {
    var presenter: VideoDetailModule.Presenter? { get set }
    
}

protocol VideoDetailModulePresenterProtocol: AnyObject {
    var view: VideoModule.View? { get set }
    var interactor: VideoModule.Interactor! { get set }
    var router: VideoModule.Router! { get set }
    
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
