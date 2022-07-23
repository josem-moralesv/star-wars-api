//
//  CharacterViewCell.swift
//  star wars api
//
//  Created by José Manuel Morales on 21/07/22.
//

import Foundation
import UIKit

class CharacterCell: UITableViewCell {
    @IBOutlet weak var characterName: UILabel!
    
    func configureCell(characterName:String){
        self.characterName.text = characterName
    }
}
