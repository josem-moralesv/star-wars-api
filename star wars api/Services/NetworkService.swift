//
//  NetworkService.swift
//  star wars api
//
//  Created by José Manuel Morales on 21/07/22.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    let BASE_URL = "http://swapi.dev/api/"
    let CHARACTERS_ENDPOINT = "people/"
    let PLANETS_ENDPOINT = "planets/"
    
    let session = URLSession(configuration: .default)
    
    func getCharacters(onSuccess: @escaping (CharactersResponse) -> Void, onError: @escaping (String) -> Void) {
        let url = URL(string: BASE_URL+CHARACTERS_ENDPOINT)!
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }
                
                do {
                    if response.statusCode == 200 {
                        let charactersResponse = try JSONDecoder().decode(CharactersResponse.self, from: data)
                        onSuccess(charactersResponse)
                    } else {
                        onError("error when decoding")
                    }
                } catch {
                    onError(error.localizedDescription)
                }
            }
        }
        
        task.resume()
    }
    
    func getPlanet(requestUrl:String, onSuccess: @escaping (Planet) -> Void, onError: @escaping (String) -> Void) {
        let url = URL(string: requestUrl)!
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }
                
                do {
                    if response.statusCode == 200 {
                        let planetResponse = try JSONDecoder().decode(Planet.self, from: data)
                        onSuccess(planetResponse)
                    } else {
                        onError("error on decoding")
                    }
                } catch {
                    onError(error.localizedDescription)
                }
            }
        }
        
        task.resume()
    }
    
}
