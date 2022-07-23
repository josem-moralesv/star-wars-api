//
//  CharactersResponse.swift
//  star wars api
//
//  Created by José Manuel Morales on 21/07/22.
//

import Foundation

class CharactersResponse: Codable {
    let count: Int
    let results: Array<Character>
}
