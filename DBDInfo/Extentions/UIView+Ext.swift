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
