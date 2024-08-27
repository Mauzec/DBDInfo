//
//  PerkCell.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/26/24.
//

import UIKit

class PerkCell: UICollectionViewCell {
    
    static let reuseID = "PerkCell"
    
    let perkImageView = PreviewImageView()
    let perkNameLabel = DITitleLabel(textAlignment: .center, fontSize: 18)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    func set(perk: Perk) {
        perkImageView.placeholderImageView.image = UIImage(named: perk.name)
        
        if perk.character.type == .survivor {
            perkImageView.setBackgroundImage(assetName: "SurvivorRarity")
            self.layer.borderColor = Colors.survivorColor.cgColor
        } else {
            perkImageView.setBackgroundImage(assetName: "KillerRarity")
            self.layer.borderColor = Colors.killerColor.cgColor
        }
        
        perkNameLabel.text  = perk.name
    }
    
    
    private func configure() {
        addSubviews(perkImageView, perkNameLabel)
        
        perkImageView.layer.cornerRadius = 0
        
        self.backgroundColor = Colors.secondaryBackground
        self.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            perkImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            perkImageView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            perkImageView.widthAnchor.constraint(equalTo: perkImageView.heightAnchor),
            perkImageView.heightAnchor.constraint(equalTo: perkImageView.widthAnchor),
            perkImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            perkImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
            
            perkNameLabel.topAnchor.constraint(equalTo: perkImageView.bottomAnchor, constant: 2),
            perkNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            perkNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            perkNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
        ])
    }
    
}
