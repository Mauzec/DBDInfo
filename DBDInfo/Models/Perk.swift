//
//  Perk.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/26/24.
//

import UIKit

struct Perk: Hashable {
    let name: String // = assetName
    let character: AnyCharacter
    
    init(_ name: String, _ character: AnyCharacter) {
        self.name = name
        self.character = character
    }
}

fileprivate struct PerkBuilder {
    static func build(_ name: String, for characterType: CharacterType, withName: String?) -> Perk {
        let character = (characterType == .survivor) ?
            (AnyCharacter(Survivor(name: withName))) : (AnyCharacter(Killer(name: withName)))
        return Perk(name, character)
    }
}

extension Perk {
    static let mainPerks = [
        PerkBuilder.build("Ace in the Hole", for: .survivor, withName: "Ace Visconti"),
        PerkBuilder.build("Adrenaline", for: .survivor, withName: "Meg Thomas"),
        PerkBuilder.build("Agitation", for: .killer, withName: "The Trapper"),
        PerkBuilder.build("Bloodhound", for: .killer, withName: "The Wraith"),
        PerkBuilder.build("Bond", for: .survivor, withName: "Dwight Fairfield"),
        PerkBuilder.build("Botany Knowledge", for: .survivor, withName: "Claudette Morel"),
        PerkBuilder.build("Brutal Strength", for: .killer, withName: "The Trapper"),
        PerkBuilder.build("Calm Spirit", for: .survivor, withName: "Jake Park"),
        PerkBuilder.build("Dark Sense", for: .survivor, withName: nil),
        PerkBuilder.build("Deerstalker", for: .killer, withName: nil),
        PerkBuilder.build("Deja Vu", for: .survivor, withName: nil),
        PerkBuilder.build("Distressing", for: .killer, withName: nil),
        PerkBuilder.build("Empathy", for: .survivor, withName: "Claudette Morel"),
        PerkBuilder.build("Enduring", for: .killer, withName: "The Hillbilly"),
        PerkBuilder.build("Unbound", for: .killer, withName: "The Unknown"),
    ]
}



