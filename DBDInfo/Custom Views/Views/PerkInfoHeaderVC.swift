//
//  PerkInfoHeaderVC.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 9/2/24.
//

import UIKit

class PerkInfoHeaderVC: UIViewController {

    let perkImageView       = PreviewImageView()
    let characterImageView: PreviewImageView?
    let perkNameLabel       = DITitleLabel(textAlignment: .left, fontSize: 18)
    let characterNameLabel  = DISecondaryLabel(textAlignment: .left, fontSize: 15)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    init(perk: Perk) {
        if let characterName = perk.character.name {
            characterImageView                              = PreviewImageView()
//            characterImageView!.placeholderImageView.image  = UIImage(named: "characterName")
            characterNameLabel.text                         = characterName
        } else {
            characterImageView      = nil
            characterNameLabel.text = "Universal"
        }
        
        perkImageView.placeholderImageView.image = UIImage(named: perk.name.rawValue)
        if perk.character.type == .survivor {
            perkImageView.setBackgroundImage(assetName: "SurvivorRarity")
        } else {
            perkImageView.setBackgroundImage(assetName: "KillerRarity")
        }
        perkNameLabel.text                       = perk.name.rawValue
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI() {
        view.addSubviews(perkImageView, perkNameLabel, characterNameLabel)
        
        NSLayoutConstraint.activate([
            perkImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            perkImageView.topAnchor.constraint(equalTo: view.topAnchor),
            perkImageView.heightAnchor.constraint(equalToConstant: 78),
            perkImageView.widthAnchor.constraint(equalToConstant: 78),
            
            perkNameLabel.leadingAnchor.constraint(equalTo: perkImageView.trailingAnchor, constant: 8),
            perkNameLabel.topAnchor.constraint(equalTo: view.topAnchor),
            perkNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            characterNameLabel.leadingAnchor.constraint(equalTo: perkImageView.trailingAnchor, constant: 8),
            characterNameLabel.topAnchor.constraint(equalTo: perkNameLabel.bottomAnchor, constant: 8),
//            characterNameLabel.heightAnchor.constraint(equalToConstant: 28),
            characterNameLabel.bottomAnchor.constraint(equalTo: perkImageView.bottomAnchor),
        ])
        
#warning("??")
        if characterImageView != nil {
            view.addSubview(characterImageView!)
            
            NSLayoutConstraint.activate([
                characterImageView!.topAnchor.constraint(equalTo: view.topAnchor),
                characterImageView!.leadingAnchor.constraint(equalTo: perkNameLabel.trailingAnchor, constant: 8),
                characterImageView!.leadingAnchor.constraint(equalTo: characterNameLabel.trailingAnchor, constant: 8),
                characterImageView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                characterImageView!.bottomAnchor.constraint(equalTo: perkImageView.bottomAnchor),
                characterImageView!.widthAnchor.constraint(equalTo: perkImageView.widthAnchor),
                characterImageView!.heightAnchor.constraint(equalTo: perkImageView.heightAnchor),
            ])
        }
    }
    
}
