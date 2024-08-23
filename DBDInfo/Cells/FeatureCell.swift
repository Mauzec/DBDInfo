//
//  FeatureCell.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/19/24.
//

import UIKit

class FeatureCell: UICollectionViewCell {
    
    static let reuseID = "FeatureCell"
    
    let symbolLabel   = DISymbolLabel(textAlignment: .center, fontSize: 44)
    let titleLabel      = DITitleLabel(textAlignment: .center, fontSize: 16)
    let secondaryLabel  = DISecondaryLabel(textAlignment: .center, fontSize: 14)
    
    static let padding: CGFloat = 6
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(feature: Feature) {
        self.titleLabel.text        = feature.title
        self.symbolLabel.text       = feature.symbol
    }
    
    
    private func configure() {
        self.addSubview(symbolLabel)
        self.addSubview(titleLabel)
        
        self.backgroundColor = Colors.secondaryBackground
        self.layer.cornerRadius = 10
        self.layer.borderColor  = UIColor.white.withAlphaComponent(0.10).cgColor
        

        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding = Self.padding
        
        NSLayoutConstraint.activate([
            symbolLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            symbolLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: 3),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 46),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding)
        ])
        
    }
}
