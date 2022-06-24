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
    var videos: [VideoModel]?
    let cellReuseIdentifier = "VideoListTableViewCell"
    
    lazy var refreshControl: UIRefreshControl = {
        let rc = UIRefreshControl()
        return rc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
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
    
    @objc func pullToRefresh() {
        presenter.fetchVideos()
    }
}

extension VideoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configureTableViewCell(indexPath: indexPath)
    }
    
    func configureTableViewCell(indexPath: IndexPath) -> VideoListTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideoListTableViewCell.identifier, for: indexPath) as! VideoListTableViewCell
        let videoData = (videos?[indexPath.row])!
        cell.configure(model: videoData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension VideoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //presenter?.didFetch(videos: [VideoModel].)
      }
}
