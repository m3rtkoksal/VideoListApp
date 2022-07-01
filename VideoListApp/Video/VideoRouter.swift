//
//  VideoRouter.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import UIKit

typealias EntryPoint = VideoModule.View & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> VideoModule.Router
}

class VideoRouter: VideoModule.Router{
    var entry: EntryPoint?
    
    static func start() -> VideoModule.Router {
        let router = VideoRouter()
        weak var presenterVC: UIViewController?
        // Assign VIP
        
        var view = VideoViewController()
        var presenter = VideoPresenter()
        var interactor = VideoInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        
        presenter.view = view
        
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        return router
    }
}
