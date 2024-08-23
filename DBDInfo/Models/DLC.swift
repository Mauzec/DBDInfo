//
//  DLC.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/22/24.
//

struct DLC: Hashable {
    let name: String
    let releaseDate: String
    let imageAsset: String?
}

extension DLC {
    static let mainDLC = [
        DLC(name: "Tomb Raider", releaseDate: "16 Jul, 2024", imageAsset: nil),
        DLC(name: "Dungeons & Dragons", releaseDate: "3 Jun, 2024", imageAsset: nil),
        DLC(name: "All Things Wicked", releaseDate: "12 Mar, 2024", imageAsset: nil)
    ]
}
