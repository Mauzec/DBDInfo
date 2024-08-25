//
//  previewImageView.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/22/24.
//

import UIKit

class PreviewImageView: UIImageView {

    let placeholderImage    = UIImage(systemName: "aqi.medium")
    
    
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
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius  = 6
//        clipsToBounds       = true
        image               = placeholderImage
        tintColor           = .white
        contentMode         = .scaleAspectFit
    }
}
