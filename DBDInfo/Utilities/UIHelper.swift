//
//  UIHelper.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/19/24.
//

import UIKit

enum UIHelper {
    static func createTwoColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        
        let availableWidth              = width - (2 * padding) - (2 * minimumItemSpacing)
        let itemWidth                   = availableWidth / 3
        
        debugPrint("view = \(width), itemWidth = \(itemWidth)")
        
        let flowLayout          = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize     = CGSize(width: itemWidth, height: itemWidth)
        
        return flowLayout
    }
}
