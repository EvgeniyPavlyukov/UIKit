//
//  Model.swift
//  UIImageView
//
//  Created by Eвгений Павлюков on 04.11.2022.
//

import Foundation
import UIKit

struct Menu {
    var name: String?
    var imageName: String?
}

struct Constants {
    static let leftDistanceToView: CGFloat = 20
    static let rightDistanceToView: CGFloat = 20
    static let topDistanceToView: CGFloat = 20
    static let bottomDistanceToView: CGFloat = 10
    static let minimumLineSpacing: CGFloat = 30
    static let itemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.minimumLineSpacing / 2)) / 2
}
