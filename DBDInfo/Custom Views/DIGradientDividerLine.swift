//
//  DIGradientLine.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/25/24.
//

import UIKit

class DIGradientDividerLine: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor,
            UIColor.clear.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.sublayers?.forEach { sublayer in
            if let gradientLayer = sublayer as? CAGradientLayer {
                gradientLayer.frame = self.bounds
            }
        }
    }
}
