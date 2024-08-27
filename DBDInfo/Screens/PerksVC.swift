//
//  PerksVCViewController.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/26/24.
//

import UIKit

class PerksVC: UIViewController {
    
    enum Section { case main }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Perk>!
    var perks: [Perk] = Perk.mainPerks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureCollectionView()
        configureDataSource()
        setData(on: perks)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func configureVC() {
        view.backgroundColor    = Colors.mainBackground
        title                   = "Perks"
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, perk in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PerkCell.reuseID, for: indexPath) as! PerkCell
            cell.set(perk: perk)
            return cell
        })
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view)
        )
        view.addSubview(collectionView)
        collectionView.delegate     = self
        collectionView.backgroundColor = Colors.mainBackground
        collectionView.register(PerkCell.self, forCellWithReuseIdentifier: PerkCell.reuseID)
    }
    
    
    func setData(on perks: [Perk]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Perk>()
        snapshot.appendSections([.main])
        snapshot.appendItems(perks)
        dataSource.apply(snapshot)
    }

}


extension PerksVC: UICollectionViewDelegate {
    

}
