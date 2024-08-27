//
//  UIHelper.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/19/24.
//

import UIKit

enum UIHelper {
    // Create three column layout for collection views
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
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
    
    static func createTwoColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        
        let availableWidth              = width - (2 * padding) - minimumItemSpacing
        let itemWidth                   = availableWidth / 2
        
        debugPrint("view = \(width), itemWidth = \(itemWidth)")
        
        let flowLayout          = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize     = CGSize(width: itemWidth, height: itemWidth)
        
        return flowLayout
    }
}

extension UIHelper {
    
    class PerkViewCache {
        private var cache = [String: UIView]()
        
        func view(for key: String, configure: () -> UIView) -> UIView {
            if let view = cache[key] { return view }
            else {
                let view = configure()
                cache[key] = view
                return view
            }
        }
    }
    
    enum PerkViewCacheBuilder {
        
    }
}

typealias PerkViewChache = UIHelper.PerkViewCache

//extension PerkViewChache {
//    static let main: [PerkViewChache] = {
//        return [
//            "Ace in the Hole":
//                
//        ]
//    }()
//}
