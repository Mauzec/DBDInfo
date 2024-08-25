//
//  DLCInfoVC.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/23/24.
//

import UIKit

class DLCInfoVC: UIViewController {
    
    var headerView      = DLCInfoHeaderView()
    var dividerView     = DIGradientDividerLine()
    var carouselView    = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    convenience init(dlc: DLC) {
        self.init(nibName: nil, bundle: nil)
        headerView.set(dlc: dlc)
        
    }
    
    
    private func add(childVC: UIViewController, toView containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    private func configureUI() {
        view.backgroundColor = Colors.mainBackground
        
        view.addSubview(headerView)
        view.addSubview(dividerView)
        view.addSubview(carouselView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            headerView.heightAnchor.constraint(equalToConstant: 45),
            
            dividerView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 5),
            
            carouselView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 12),
            carouselView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            carouselView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            carouselView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
}
