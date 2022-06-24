//
//  VideoHelper.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import UIKit

extension VideoModule {
  
  static func createModule() -> UIViewController {
    let view = VideoViewController()
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
