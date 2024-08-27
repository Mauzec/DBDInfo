//
//  Feature.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/19/24.
//

import UIKit


struct Feature {
    let title: String
    let secondary: String
    let additional: String?
    let symbol: String
    let destinationScreenType: UIViewController.Type
    
    init(title: String, secondary: String, additional: String?, symbol: String, screenType: UIViewController.Type) {
        self.title = title
        self.secondary = secondary
        self.additional = additional
        self.symbol = symbol
        self.destinationScreenType = screenType
    }
    
    init(title: String, secondary: String, symbol: String, screenType: UIViewController.Type) {
        self.init(title: title, secondary: secondary, additional: nil, symbol: symbol, screenType: screenType)
    }
    init(title: String, symbol: String, screenType: UIViewController.Type) {
        self.init(title: title, secondary: "", additional: nil, symbol: symbol, screenType: screenType)
    }
}


extension Feature: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(secondary)
        hasher.combine(additional)
        hasher.combine(symbol)
        hasher.combine(ObjectIdentifier(destinationScreenType))
    }
    
    static func == (lhs: Feature, rhs: Feature) -> Bool {
        return  lhs.title       == rhs.title &&
                lhs.secondary   == rhs.secondary &&
                lhs.additional  == rhs.additional &&
                lhs.symbol      == rhs.symbol &&
                ObjectIdentifier(lhs.destinationScreenType) == ObjectIdentifier(rhs.destinationScreenType)
    }
    
    
}


extension Feature {
    static let mainFeatures = [
//        Self(title: "Leaderboard", secondary: "Check your or others position in global Steam Leaderboard", additional: "Steam users only", symbol:Symbols.earthAmericans),
//        Self(title: "Player Profile", secondary: "Check your or others statistics, from Bloodpoints to Escapes and beyond", additional: "Steam users only", symbol: Symbols.circleUser),
//        Self(title: "Shrine Of Secrets", secondary: "Weekly Shrine Of Secrets", additional: nil, symbol: Symbols.toriiGate),
//        Self(title: "News", symbol: Symbols.newspaper),
//        Self(title: "Tomes", symbol: Symbols.towerObservation),
//        Self(title: "Rifts", symbol: Symbols.star),
//        Self(title: "Rift Calculator", symbol: Symbols.calculator),
//        Self(title: "Journals", symbol: Symbols.book),
//        Self(title: "Maps", symbol: Symbols.map),
//        Self(title: "Randomizer", symbol: Symbols.shuffle),
//        Self(title: "Characters", symbol: Symbols.users),
//        Self(title: "Store", symbol: Symbols.store),
//        Self(title: "Offerings", symbol: Symbols.gift),
        Self(title: "Perks", symbol: Symbols.paperclip, screenType: PerksVC.self),
//        Self(title: "Items", symbol: Symbols.key),
//        Self(title: "Addons", symbol: Symbols.puzzlePiece),
//        Self(title: "Tier List", symbol: Symbols.table),
//        Self(title: "Builds", symbol: Symbols.wrench),
//        Self(title: "Kill Switch", symbol: Symbols.triangleExclamation),
        Self(title: "DLCs", symbol: Symbols.unlock, screenType: DLCVC.self)
    ]
}
