//
//  PerkInfoVC.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/28/24.
//

import UIKit
import ActiveLabel

class PerkInfoVC: UIViewController {
    
    var infoVC: PerkInfoBlockVC!
    var quoteVC: PerkInfoBlockVC!
    var headerVC: PerkInfoHeaderVC!
    let dividerOne = DIGradientDividerLine()
    let dividerTwo = DIGradientDividerLine()
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(perk: Perk, perkInfoLabels: (ActiveLabel, UILabel)) {
//        self.perkInfoLabel = perkInfoLabels.0
//        self.perkQuoteLabel = perkInfoLabels.1
//        self.perkNameLabel.text = perk.name.rawValue
//        self.perkImageView.placeholderImageView.image = UIImage(named: perk.name.rawValue)
//        self.characterType = perk.character.type
//        
//        if let characterName = perk.character.name {
//            characterNameLabel = DIAdditionalLabel(textAlignment: .center, fontSize: 16)
//            characterNameLabel!.text = "(\(characterName))"
//        }
        super.init(nibName: nil, bundle: nil)
//        configureUIBlocks(perk: perk, infoLabel: perkInfoLabels.0, quoteLabel: perkInfoLabels.1)
        infoVC      = PerkInfoBlockVC(title: "About", bodyLabel: perkInfoLabels.0)
        quoteVC     = PerkInfoBlockVC(title: "Memory", bodyLabel: perkInfoLabels.1)
        headerVC    = PerkInfoHeaderVC(perk: perk)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        
        addChild(headerVC)
        addChild(infoVC)
        addChild(quoteVC)
        
        headerVC.didMove(toParent: self)
        infoVC.didMove(toParent: self)
        quoteVC.didMove(toParent: self)
        
        configureUI()
    }
    
    
    private func configureVC() {
        view.backgroundColor = Colors.mainBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func configureUIBlocks(perk: Perk, infoLabel: ActiveLabel, quoteLabel: UILabel) {
        infoVC      = PerkInfoBlockVC(title: "About", bodyLabel: infoLabel)
        quoteVC     = PerkInfoBlockVC(title: "Memory", bodyLabel: quoteLabel)
        headerVC    = PerkInfoHeaderVC(perk: perk)
    }
    
    private func configureUI() {
        view.addSubviews(headerVC.view, infoVC.view, quoteVC.view, dividerOne, dividerTwo)
        
        headerVC.view.translatesAutoresizingMaskIntoConstraints = false
        infoVC.view.translatesAutoresizingMaskIntoConstraints = false
        quoteVC.view.translatesAutoresizingMaskIntoConstraints = false
        dividerOne.translatesAutoresizingMaskIntoConstraints = false
        dividerTwo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            headerVC.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            headerVC.view.heightAnchor.constraint(equalToConstant: 80),
            
            dividerOne.topAnchor.constraint(equalTo: headerVC.view.bottomAnchor, constant: 6),
            dividerOne.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerOne.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerOne.heightAnchor.constraint(equalToConstant: 4),
            
            infoVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoVC.view.topAnchor.constraint(equalTo: dividerOne.bottomAnchor, constant: 6),
            
            dividerTwo.topAnchor.constraint(equalTo: infoVC.view.bottomAnchor, constant: 6),
            dividerTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerTwo.heightAnchor.constraint(equalToConstant: 4),
            
            quoteVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            quoteVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            quoteVC.view.topAnchor.constraint(equalTo: dividerTwo.bottomAnchor, constant: 6),
        ])
    }
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}

