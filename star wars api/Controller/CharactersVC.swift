//
//  ViewController.swift
//  star wars api
//
//  Created by José Manuel Morales on 21/07/22.
//

import UIKit

class CharactersVC: UIViewController {
    
    @IBOutlet weak var characterTableView:UITableView!
    
    var characters = Array<Character>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterTableView.delegate = self
        characterTableView.dataSource = self
        // Do any additional setup after loading the view.
        getCharacters()
    }
    
    func getCharacters(){
        NetworkService.shared.getCharacters(onSuccess: { (charactersResponse) in
            print("response!? elements:\(charactersResponse.count)")
            self.characters = charactersResponse.results
            self.characterTableView.reloadData()
        }, onError: {(errorCode) in
            debugPrint(errorCode)
        })
    }
}

extension CharactersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as? CharacterCell else {
                return UITableViewCell()
        }
        cell.configureCell(characterName: self.characters[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCharacter = characters[indexPath.row]
        performSegue(withIdentifier: "CharacterVC", sender: selectedCharacter)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let characterVC = segue.destination as? CharacterVC {
            characterVC.setCharacter(character: sender as! Character)
        }
    }
}

