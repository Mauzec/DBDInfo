//
//  Characters.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/26/24.
//

enum CharacterType {
    case survivor
    case killer
}


protocol Character: Hashable {
    var type: CharacterType { get }
    var name: String? { get }
}

extension Character {
    func isEqual(_ other: any Character) -> Bool {
        guard let otherCharacter = other as? Self else { return false }
        return self == otherCharacter
    }
}


struct Survivor: Character {
    var type = CharacterType.survivor
    var name: String?
}

struct Killer: Character {
    var type = CharacterType.killer
    var name: String?
}


struct AnyCharacter {
    private let character: any Character
    
    init<C>(_ character: C) where C: Character {
        self.character = character
    }
    
    var type: CharacterType { character.type }
    var name: String? { character.name }
}

extension AnyCharacter: Equatable {
    
    static func ==(lhs: AnyCharacter, rhs: AnyCharacter) -> Bool {
        lhs.character.isEqual(rhs.character)
    }
}

extension AnyCharacter: Hashable {
    
    func hash(into hasher: inout Hasher) {
        character.hash(into: &hasher)
    }
}
