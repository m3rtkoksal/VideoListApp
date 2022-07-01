//
//  UITableViewExtension.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import UIKit

extension UITableView {
    
    func tableViewHeight() -> CGFloat {
        self.layoutIfNeeded()
        return self.contentSize.height
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: Reusable, T: NibLoadable {
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(T.reuseIdentifier)")
        }
        return cell
    }
}

extension UITableView {
    //    MARK: - TableView'ın reload olup olmadığını anlamamıza yarayan Bool
    private static var _isRefreshing = false
    var isRefreshing: Bool {
        get {
            return UITableView._isRefreshing
        } set(newValue) {
            UITableView._isRefreshing = newValue
        }
    }
    //    MARK: - Completion handler'lı reloadData fonksiyonu
    func reloadData(completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
        { _ in completion() }
    }
    //    MARK: - Kingfisher imageları set ederken tableview'ın reload olma durumu ve varsa lazy loading isRefreshing ile kontrol edilerek
    //    (isRefreshing false is asynchronous, true is synchronous şekilde image set ediliyor) image'ın kaybolma ve flick etme sorunu çözülüyor.
    func reloadDataWithIsRefreshing() {
        self.isRefreshing = true
        self.reloadData {
            self.isRefreshing = false
        }
    }
}
