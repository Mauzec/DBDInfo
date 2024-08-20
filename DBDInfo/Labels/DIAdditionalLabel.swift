//
//  DITitleLabel.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/19/24.
//

import UIKit

class DIAdditionalLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .thin)
    }
    
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.textColor                  = .white
        self.adjustsFontSizeToFitWidth  = true
        self.minimumScaleFactor         = 0.75
        self.lineBreakMode              = .byTruncatingTail
        self.numberOfLines              = 1
    }
    
}
