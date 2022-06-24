//
//  Reusable.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import Foundation

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
