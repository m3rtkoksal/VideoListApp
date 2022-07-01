//
//  VideoDetailHelper.swift
//  VideoListApp
//
//  Created by Mert Köksal on 1.07.2022.
//

import UIKit

extension VideoDetailModule {
  
  static func createModule() -> UIViewController {
    let view = VideoListVC()
    let interactor = VideoInteractor()
    let presenter = VideoPresenter()
    let router = VideoRouter()
    
    presenter.interactor = interactor
    presenter.view = view
    presenter.router = router
    view.presenter = presenter
    interactor.presenter = presenter
    router.presenterVC = view
    
    return view
  }
}
