//
//  VideoDataSource.swift
//  VideoListApp
//
//  Created by Mert Köksal on 1.07.2022.
//

import UIKit

class VideoTableViewDataSource: NSObject {
    typealias RowItem = VideoModule.VideoViewModel
  
  weak var tableView: UITableView?
  weak var presenter: VideoModule.Presenter?
  
  private var items: [RowItem] = []
  
  required init(_ tableView: UITableView?) {
    super.init()
    self.tableView = tableView
    registerCells()
    
    // configure table view
    self.tableView?.estimatedRowHeight = 40
    self.tableView?.rowHeight = UITableView.automaticDimension
    self.tableView?.dataSource = self
    self.tableView?.delegate = self
    self.tableView?.backgroundColor = .clear
    self.tableView?.separatorStyle = .none
  }
  
  private func registerCells() {
      tableView?.register(VideoListTableViewCell.nib, forCellReuseIdentifier: VideoListTableViewCell.identifier)
  }
}

extension VideoTableViewDataSource {
  
  func setItems(_ items: [RowItem]) {
    self.items = items
    tableView?.reloadData()
  }
}

extension VideoTableViewDataSource: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell: VideoListTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      cell.configure(model: items[indexPath.row])
      return cell
  }
}

extension VideoTableViewDataSource: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter?.didSelect(item: items[indexPath.row])
  }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}


private extension VideoListTableViewCell {
  
    func configure(with model: VideoModule.VideoViewModel) {
        configure(model: model)
  }
}


