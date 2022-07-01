//
//  VideoListVC.swift
//  VideoListApp
//
//  Created by Mert Köksal on 1.07.2022.
//

import UIKit

class VideoListVC: UIViewController, VideoModule.View {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: VideoModule.Presenter!
    private var dataSource: VideoTableViewDataSource!
    
    lazy var refreshControl: UIRefreshControl = {
        let rc = UIRefreshControl()
        return rc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter.fetchVideos()
        setupUI()
    }
    
    @objc func pullToRefresh() {
        presenter.fetchVideos()
    }
    
    private func setupUI() {
        dataSource = .init(tableView)
        dataSource.presenter = presenter
    }
}

extension VideoListVC {
    
    func updateVideoList(_ items: [VideoModule.VideoViewModel]) {
        dataSource.setItems(items)
    }
}
