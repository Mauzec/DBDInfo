//
//  DITitleLabel.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/19/24.
//

import UIKit

class DISecondaryLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat, textColor: UIColor = .white) {
        self.init(frame: .zero)
        self.textAlignment  = textAlignment
        self.font           = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        self.textColor      = textColor
    }
    
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.adjustsFontSizeToFitWidth  = true
        self.minimumScaleFactor         = 0.75
        self.lineBreakMode              = .byTruncatingTail
        self.numberOfLines              = 0
    }
    
}
