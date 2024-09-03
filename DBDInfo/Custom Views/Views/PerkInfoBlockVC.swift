//
//  PerkInfoBlockVC.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 9/2/24.
//

import UIKit

class PerkInfoBlockVC: UIViewController {

    let titleLabel = DITitleLabel(textAlignment: .center, fontSize: 26)
    let bodyLabel: UILabel!
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(title: String, bodyLabel: UILabel) {
        self.titleLabel.text    = title
        self.bodyLabel          = bodyLabel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureVC()
        configureTitleLabel()
        configureBodyLabel()
    }
    
    
    private func configureVC() {
        view.layer.cornerRadius = 18
        view.layer.borderWidth  = 2
        view.layer.borderColor  = UIColor.gray.cgColor
    }
    
    private func configureBodyLabel() {
        view.addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            bodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            bodyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -6),
        ])
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            titleLabel.heightAnchor.constraint(equalToConstant: 26),
        ])
    }
}
