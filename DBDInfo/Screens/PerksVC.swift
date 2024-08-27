//
//  PerksVCViewController.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/26/24.
//

import UIKit

#warning("TODO: navigation bar blur effect")

class PerksVC: UIViewController {
    
    enum Section { case main }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Perk>!
    var perks: [Perk]           = Perk.mainPerks
    var filteredPerks: [Perk]   = []
    var isSearching: Bool       = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureCollectionView()
        configureDataSource()
        configureSearchController()
        updateData(on: perks)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    private func configureVC() {
        view.backgroundColor    = Colors.mainBackground
        title                   = "Perks"
//        
//        does not work
        
//        let customBlurEffectView = CustomBlurEffectView(
//            radius: 20,
//            color: Colors.mainBackground,
//            colorAlpha: 0.4
//        )
//        customBlurEffectView.frame = navigationController?.navigationBar.bounds ?? CGRect.zero
//        navigationController?.navigationBar.addSubview(customBlurEffectView)
//        navigationController?.navigationBar.sendSubviewToBack(customBlurEffectView)
//
//        debugPrint(customBlurEffectView.frame)
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
    
    private func configureSearchController() {
        let searchController                                    = UISearchController()
        searchController.searchResultsUpdater                   = self
        searchController.obscuresBackgroundDuringPresentation   = false
        searchController.definesPresentationContext             = true
        searchController.searchBar.searchTextField.leftView?.tintColor = .white
        navigationItem.searchController                         = searchController
        navigationItem.hidesSearchBarWhenScrolling              = true
//        navigationController?.navigationBar.isTranslucent       = true
        
    }
    
    
    func updateData(on perks: [Perk]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Perk>()
        snapshot.appendSections([.main])
        snapshot.appendItems(perks)
        dataSource.apply(snapshot)
    }

}


extension PerksVC: UICollectionViewDelegate {
    

}


extension PerksVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            filteredPerks.removeAll()
            updateData(on: perks)
            isSearching = true
            return
        }
        
        isSearching = true
        
        filteredPerks = perks.filter({
            $0.name.lowercased().contains(filter.lowercased())
        })
        updateData(on: filteredPerks)
    }
    
    
}
