//
//  CharacterVC.swift
//  star wars api
//
//  Created by José Manuel Morales on 21/07/22.
//

import Foundation
import UIKit

class CharacterVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var birthyearLabel: UILabel!
    @IBOutlet weak var planelLabel: UILabel!
    
    private(set) public var character: Character!
    private(set) public var planet: Planet!
    
    func setCharacter(character: Character) {
        self.character = character
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = character.name
        heightLabel.text = "Height: \(character.height)"
        massLabel.text = "Mass: \(character.mass)"
        birthyearLabel.text = "Birthyear: \(character.birth_year)"
        
        getPlanet(planetUrl: character.homeworld)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        planelLabel.isUserInteractionEnabled = true
        
        //maybe add the listener when the response is ready
        planelLabel.addGestureRecognizer(tap)
    }
    
    func getPlanet(planetUrl: String) {
        NetworkService.shared.getPlanet(requestUrl: planetUrl, onSuccess: {(planet) in
            self.planet = planet
            self.planelLabel.text = "Planet: \(planet.name)"
        }, onError: {(error) in
            debugPrint(error)
        })
    }
    
    @IBAction func tapFunction(sender:UITapGestureRecognizer) {
        performSegue(withIdentifier: "PlanetVC", sender: self.planet)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let planetVC = segue.destination as? PlanetVC {
            planetVC.setPlanet(planet: self.planet)
        }
    }
}
