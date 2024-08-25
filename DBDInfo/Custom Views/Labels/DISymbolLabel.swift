//
//  DITitleLabel.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/19/24.
//

import UIKit

class DISymbolLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.font = UIFont(name: "FontAwesome6Free-Solid", size: fontSize)
        self.textAlignment = textAlignment
    }
    
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.textColor                  = UIColor(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
        self.adjustsFontSizeToFitWidth  = true
        self.minimumScaleFactor         = 0.75
        self.lineBreakMode              = .byTruncatingTail
        self.numberOfLines              = 1
    }
    
}
