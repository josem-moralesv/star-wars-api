//
//  PlanetVC.swift
//  star wars api
//
//  Created by José Manuel Morales on 21/07/22.
//

import Foundation
import UIKit

class PlanetVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rotationLabel: UILabel!
    @IBOutlet weak var orbitalLabel: UILabel!
    @IBOutlet weak var diameterLabel: UILabel!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var gravityLabel: UILabel!
    @IBOutlet weak var terrainLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    private(set) public var planet: Planet!
    
    func setPlanet(planet: Planet) {
        self.planet = planet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = planet.name
        rotationLabel.text = "Rotation period: \(planet.rotation_period)"
        orbitalLabel.text = "Orbital period: \(planet.orbital_period)"
        diameterLabel.text = "Diameter: \(planet.diameter)"
        climateLabel.text = "Climate: \(planet.climate)"
        gravityLabel.text = "Gravity: \(planet.gravity)"
        terrainLabel.text = "Terrain: \(planet.terrain)"
        populationLabel.text = "Population: \(planet.population)"
    }
}
