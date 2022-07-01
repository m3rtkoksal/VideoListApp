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
    
    lazy var refreshControl: UIRefreshControl = {
        let rc = UIRefreshControl()
        return rc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter.fetchVideos()
        
    }
    
    func configureTableView() {
        tableView.register(VideoListTableViewCell.self)
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 70
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
    }
    
    @objc func pullToRefresh() {
        presenter.fetchVideos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            let videoDetailVC = segue.destination as! VideoDetailViewController
            videoDetailVC.selectedVideo = sender as? VideoModel
        }
    }
}

extension VideoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configureTableViewCell(indexPath: indexPath)
    }
    
    func configureTableViewCell(indexPath: IndexPath) -> VideoListTableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as VideoListTableViewCell
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
