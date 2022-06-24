//
//  NibLoadable.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import UIKit

protocol NibLoadable: AnyObject {
    static var nib: UINib { get }
}

extension NibLoadable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for:self))
    }
}
