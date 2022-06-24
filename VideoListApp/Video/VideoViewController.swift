//
//  VideoViewController.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import UIKit

class VideoViewController: UIViewController, VideoModule.View  {
    @IBOutlet weak var tableView: UITableView!
    var presenter: VideoModule.Presenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
        presenter.fetchVideos()
    }
    
    private func configureTableView() {
        tableView.register(VideoListTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
    }

}

