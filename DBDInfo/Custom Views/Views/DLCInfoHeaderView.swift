//
//  DLCInfoHeaderView.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/25/24.
//

import UIKit

class DLCInfoHeaderView: UIView {
    
    let dlcNameLabel     = DITitleLabel(textAlignment: .center, fontSize: 26)
    let releaseDateLabel = DISecondaryLabel(textAlignment: .center, fontSize: 16, textColor: .gray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(dlc: DLC) {
        self.dlcNameLabel.text = dlc.name
        self.releaseDateLabel.text = "RELEASE DATE: \(dlc.releaseDate)"
    }
    
    
    private func configure() {
        self.addSubviews(dlcNameLabel, releaseDateLabel)
        
        NSLayoutConstraint.activate([
            dlcNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dlcNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dlcNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            dlcNameLabel.heightAnchor.constraint(equalToConstant: 28),
            
            releaseDateLabel.topAnchor.constraint(equalTo: dlcNameLabel.bottomAnchor, constant: 2),
            releaseDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            releaseDateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            releaseDateLabel.heightAnchor.constraint(equalToConstant: 18),
        ])
    }
}
