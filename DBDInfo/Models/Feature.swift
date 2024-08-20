//
//  Feature.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/19/24.
//

import UIKit

struct Feature: Hashable {
    let title: String
    let secondary: String
    let additional: String?
    let symbol: String
    
    init(title: String, secondary: String, additional: String?, symbol: String) {
        self.title = title
        self.secondary = secondary
        self.additional = additional
        self.symbol = symbol
    }
    
    init(title: String, secondary: String, symbol: String) {
        self.init(title: title, secondary: secondary, additional: nil, symbol: symbol)
    }
    init(title: String, symbol: String) {
        self.init(title: title, secondary: "", additional: nil, symbol: symbol)
    }
}

extension Feature {
    static let mainFeatures = [
        Self(title: "Leaderboard", secondary: "Check your or others position in global Steam Leaderboard", additional: "Steam users only", symbol:Symbols.earthAmericans),
        Self(title: "Player Profile", secondary: "Check your or others statistics, from Bloodpoints to Escapes and beyond", additional: "Steam users only", symbol: Symbols.circleUser),
        Self(title: "Shrine Of Secrets", secondary: "Weekly Shrine Of Secrets", additional: nil, symbol: Symbols.toriiGate),
        Self(title: "News", symbol: Symbols.newspaper),
        Self(title: "Tomes", symbol: Symbols.towerObservation),
        Self(title: "Rifts", symbol: Symbols.star),
        Self(title: "Rift Calculator", symbol: Symbols.calculator),
        Self(title: "Journals", symbol: Symbols.book),
        Self(title: "Maps", symbol: Symbols.map),
        Self(title: "Randomizer", symbol: Symbols.shuffle),
        Self(title: "Characters", symbol: Symbols.users),
        Self(title: "Store", symbol: Symbols.store),
        Self(title: "Offerings", symbol: Symbols.gift),
        Self(title: "Perks", symbol: Symbols.paperclip),
        Self(title: "Items", symbol: Symbols.key),
        Self(title: "Addons", symbol: Symbols.puzzlePiece),
        Self(title: "Tier List", symbol: Symbols.table),
        Self(title: "Builds", symbol: Symbols.wrench),
        Self(title: "Kill Switch", symbol: Symbols.triangleExclamation),
        Self(title: "DLCs", symbol: Symbols.unlock)
    ]
}
