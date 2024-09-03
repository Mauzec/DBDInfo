//
//  previewImageView.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/22/24.
//

import UIKit

class PreviewImageView: UIView {

    let placeholderImageView                = UIImageView(image: UIImage(systemName: "aqi.medium"))
    var backgroundImageView: UIImageView?   = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    
    func setBackgroundImage(assetName: String) {
        if backgroundImageView != nil {
            backgroundImageView!.image = UIImage(named: assetName)
            return
        }
        backgroundImageView = addBackgroundImage(named: assetName)
        NSLayoutConstraint.activate([
            backgroundImageView!.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView!.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView!.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView!.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func configure() {
        addSubview(placeholderImageView)
        placeholderImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeholderImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            placeholderImageView.topAnchor.constraint(equalTo: topAnchor),
            placeholderImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            placeholderImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius  = 6
//        clipsToBounds       = true
        tintColor           = .white
        contentMode         = .scaleAspectFit
    }
}
