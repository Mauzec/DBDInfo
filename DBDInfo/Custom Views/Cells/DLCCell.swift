//
//  DLCCell.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/22/24.
//

import UIKit

class DLCCell: UITableViewCell {
    
    static let reuseID = "DLCCell"
    
    let previewImageView    = PreviewImageView()
    let dlcNameLabel        = DITitleLabel(textAlignment: .left, fontSize: 20)
    let releaseDataLabel    = DISecondaryLabel(textAlignment: .left, fontSize: 14)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(dlc: DLC) {
        if dlc.imageAsset != nil {
            previewImageView.placeholderImageView.image = UIImage(named: dlc.imageAsset!)
        }
        dlcNameLabel.text       = dlc.name
        releaseDataLabel.text   = dlc.releaseDate
    }
    
    
    private func configure() {
        self.addSubview(previewImageView)
        self.addSubview(dlcNameLabel)
        self.addSubview(releaseDataLabel)
        self.backgroundColor = Colors.secondaryBackground
        
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        
        let padding: CGFloat    = 6
        
        NSLayoutConstraint.activate([
            previewImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            previewImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            previewImageView.heightAnchor.constraint(equalToConstant: 36),
            previewImageView.widthAnchor.constraint(equalToConstant: 36),
            
            dlcNameLabel.leadingAnchor.constraint(equalTo: previewImageView.trailingAnchor, constant: padding),
            dlcNameLabel.topAnchor.constraint(equalTo: previewImageView.topAnchor, constant: 1),
            dlcNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            dlcNameLabel.heightAnchor.constraint(equalToConstant: 20.5),
            
            releaseDataLabel.topAnchor.constraint(equalTo: dlcNameLabel.bottomAnchor, constant: 1),
            releaseDataLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            releaseDataLabel.leadingAnchor.constraint(equalTo: previewImageView.trailingAnchor, constant: padding),
            releaseDataLabel.heightAnchor.constraint(equalToConstant: 14.5),
        ])
    }
}
