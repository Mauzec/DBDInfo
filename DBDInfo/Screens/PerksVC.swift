//
//  PerksVCViewController.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/26/24.
//

import UIKit
import ActiveLabel

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
        DispatchQueue.main.async { [weak self] in
            self?.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }

}


extension PerksVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let consideredPerks = isSearching ? filteredPerks : perks
        let perk = consideredPerks[indexPath.item]
        let perkLabels = PerkInfoLabelStore.labels(for: perk.name)
        
        present(PerkInfoVC(perk: perk, perkInfoLabels: perkLabels), animated: true)
    }
}


extension PerksVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            filteredPerks.removeAll()
            updateData(on: perks)
            isSearching = false
            return
        }
        
        isSearching = true
        
        filteredPerks = perks.filter({
            $0.name.rawValue.lowercased().contains(filter.lowercased())
        })
        updateData(on: filteredPerks)
    }
}


fileprivate extension PerksVC {
    
    struct PerkInfoLabelStore {
        
        static func labels(for perkName: PerkName) -> (ActiveLabel, UILabel) {
            switch perkName {
            case .aceInTheHole:
                return aceInTheHole()
            case .adrenaline:
                return adrenaline()
            case .agitation:
                break
            case .bloodhound:
                break
            case .bond:
                break
            case .botanyKnowledge:
                break
            case .brutalStrength:
                break
            case .calmSpirit:
                break
            case .darkSense:
                break
            case .deerstalker:
                break
            case .dejaVu:
                break
            case .distressing:
                break
            case .empathy:
                break
            case .enduring:
                break
            case .unbound:
                break
            }
            return (ActiveLabel(), UILabel())
        }
        
        static let adrenaline = {
            let perkLabel = ActiveLabel()
            
            perkLabel.customize { label in
                let types = [
                    ActiveType.custom(pattern: "%")
                ]
            }
            
            return (perkLabel, UILabel())
        }
        
        static let aceInTheHole = {
            let perkLabel = ActiveLabel()

            perkLabel.customize { label in
                let types = [
                    ActiveType.custom(pattern: "%"),
                    ActiveType.custom(pattern: "100"),
                    ActiveType.custom(pattern: "Very Rare"),
                    ActiveType.custom(pattern: "10\\b"),
                    ActiveType.custom(pattern: "25\\b"),
                    ActiveType.custom(pattern: "50"),
                    ActiveType.custom(pattern: "Uncommon"),
                ]
                
                label.text =
"""
Lady Luck always seems to be throwing something good your way.
When retrieving an item from a chest, there is a 100% chance that a Very Rare (or lower) add-on will be attached to it.
10/25/50% chance of finding an add-on of Uncommon rarity (or lower).
When escaping, keep any add-ons your item has.
"""
                
                perkLabel.enabledTypes = types
                perkLabel.customColor[types[0]] = Colors.highlight1Color
                perkLabel.customColor[types[1]] = Colors.uncommonRarityColor
                perkLabel.customColor[types[2]] = Colors.highlight2Color
                perkLabel.customColor[types[3]] = Colors.uncommonRarityColor
                perkLabel.customColor[types[4]] = Colors.rareRarityColor
                perkLabel.customColor[types[5]] = Colors.veryrareRarityColor
                perkLabel.customColor[types[6]] = Colors.highlight4Color
                
                perkLabel.numberOfLines = 0
                perkLabel.textColor     = .white
                perkLabel.translatesAutoresizingMaskIntoConstraints = false
                perkLabel.textAlignment = .center
                perkLabel.sizeToFit()
            }
            
            let perkQuoteLabel = UILabel()
            perkQuoteLabel.font = UIFont.italicSystemFont(ofSize: 16)
            perkQuoteLabel.text = "”Everything that glitters isn’t gold. But gold isn't worth a damn in this place, so this should come in handy.” -Ace"
            perkQuoteLabel.numberOfLines = 0
            perkQuoteLabel.textColor = Colors.flavorColor
            perkQuoteLabel.translatesAutoresizingMaskIntoConstraints = false
            perkQuoteLabel.textAlignment = .center
            perkQuoteLabel.sizeToFit()
            
            return (perkLabel, perkQuoteLabel)
        }
    }
}
