//
//  UIViewController+Ext.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/23/24.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views { self.addSubview(view) }
    }
}

extension UIView {
    func addBackgroundImage(named: String) -> UIImageView {
        let backgroundImage = UIImageView(frame: self.frame)
        backgroundImage.image = UIImage(named: named)
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false

        self.insertSubview(backgroundImage, at: 0)
        self.sendSubviewToBack(backgroundImage)
        
        return backgroundImage
    }
}
