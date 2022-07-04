//
//  VideoDetailHelper.swift
//  VideoListApp
//
//  Created by Mert Köksal on 1.07.2022.
//

import UIKit

extension VideoDetailModule {
  
    static func createModule(videoItem: VideoModule.VideoViewModel) -> UIViewController {
        
    let view = VideoDetailViewController()
    let interactor = VideoDetailInteractor(videoItem: videoItem)
    let presenter = VideoDetailPresenter()
    
    presenter.interactor = interactor
    presenter.view = view
    view.presenter = presenter
    interactor.presenter = presenter
    
    return view
  }
}
