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
    var features: [Feature] = Feature.mainFeatures

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureCollectionView()
        configureDataSource()
        setData(on: features)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.setToolbarHidden(true, animated: true)
    }
    
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, feature in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeatureCell.reuseID, for: indexPath) as! FeatureCell
            cell.set(feature: feature)
            return cell
        })
    }
    
    func configureVC() {
        title = "Featers"
    }
    
    
    func configureCollectionView() {
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view)
        )
        view.addSubview(collectionView)
        collectionView.delegate         = self
        collectionView.backgroundColor  = Colors.mainBackground
        
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
        let feature     = features[indexPath.item]
        let destVC      = feature.destinationScreenType.init()
        navigationController?.pushViewController(destVC, animated: true)
    }
}

extension FeaturesVC {
    enum Section { case main }
}
