//
//  ViewController.swift
//  PracticaJSON1
//
//  Created by MacBook on 22/12/22.
//

import UIKit

struct People: Decodable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let created: String
    let edited: String
    let url: String
}

struct PeopleResponse: Decodable {
    let count: Int
    let next: String
    let previous: String?
    let results: [People]
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Funcion que cargara los datos desde un api
    func loadPeople() {
        
    }
    
    // 1 - CREAR URL
    // 2 - CREAR UNA SESION
    // 3 - 
}

