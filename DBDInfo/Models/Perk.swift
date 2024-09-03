//
//  Perk.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/26/24.
//

import UIKit

enum PerkName: String, Hashable {
    case aceInTheHole       = "Ace in the Hole"
    case adrenaline         = "Adrenaline"
    case agitation          = "Agitation"
    case bloodhound         = "Bloodhound"
    case bond               = "Bond"
    case botanyKnowledge    = "Botany Knowledge"
    case brutalStrength     = "Brutal Strength"
    case calmSpirit         = "Calm Spirit"
    case darkSense          = "Dark Sense"
    case deerstalker        = "Deerstalker"
    case dejaVu             = "Deja Vu"
    case distressing        = "Distressing"
    case empathy            = "Empathy"
    case enduring           = "Enduring"
    case unbound            = "Unbound"
}


struct Perk: Hashable {
    let name: PerkName // = assetName
    let character: AnyCharacter
    
    init(_ name: PerkName, _ character: AnyCharacter) {
        self.name = name
        self.character = character
    }
}

fileprivate struct PerkBuilder {
    static func build(_ name: PerkName, for characterType: CharacterType, withName: String?) -> Perk {
        let character = (characterType == .survivor) ?
            (AnyCharacter(Survivor(name: withName))) : (AnyCharacter(Killer(name: withName)))
        return Perk(name, character)
    }
}

extension Perk {
    static let mainPerks = [
        PerkBuilder.build(.aceInTheHole, for: .survivor, withName: "Ace Visconti"),
        PerkBuilder.build(.adrenaline, for: .survivor, withName: "Meg Thomas"),
        PerkBuilder.build(.agitation, for: .killer, withName: "The Trapper"),
        PerkBuilder.build(.bloodhound, for: .killer, withName: "The Wraith"),
        PerkBuilder.build(.bond, for: .survivor, withName: "Dwight Fairfield"),
        PerkBuilder.build(.botanyKnowledge, for: .survivor, withName: "Claudette Morel"),
        PerkBuilder.build(.brutalStrength, for: .killer, withName: "The Trapper"),
        PerkBuilder.build(.calmSpirit, for: .survivor, withName: "Jake Park"),
        PerkBuilder.build(.darkSense, for: .survivor, withName: nil),
        PerkBuilder.build(.deerstalker, for: .killer, withName: nil),
        PerkBuilder.build(.dejaVu, for: .survivor, withName: nil),
        PerkBuilder.build(.distressing, for: .killer, withName: nil),
        PerkBuilder.build(.empathy, for: .survivor, withName: "Claudette Morel"),
        PerkBuilder.build(.enduring, for: .killer, withName: "The Hillbilly"),
        PerkBuilder.build(.unbound, for: .killer, withName: "The Unknown"),
    ]
}



