//
//  FavoritesVC.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/19/24.
//

import UIKit

class FeaturesVC: UIViewController {
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Feature>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureCollectionView()
        configureDataSource()
        setData(on: Feature.mainFeatures)
    }
    
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, feature in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeatureCell.reuseID, for: indexPath) as! FeatureCell
            cell.set(feature: feature)
            return cell
        })
    }
    
    func configureVC() {
        
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view)
        )
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor          = UIColor.init(red: 41 / 255, green: 41 / 255, blue: 41 / 255, alpha: 1)
        collectionView.register(FeatureCell.self, forCellWithReuseIdentifier: FeatureCell.reuseID)
    }
    
    func setData(on features: [Feature]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Feature>()
        snapshot.appendSections([.main])
        snapshot.appendItems(features)
        
        self.dataSource.apply(snapshot)
    }
    
}

extension FeaturesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension FeaturesVC {
    enum Section { case main }
}
