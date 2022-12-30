//
//  ViewController.swift
//  3201_Repaso_P31
//
//  Created by MacBook on 20/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Diseño y conección de la propiedad @IBOutlet var myTableView
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Definimos quien es delegate y quien es el dataSource
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}

// Repositorio de Razas de perros
class RazasPerrosRepository {
    // Singleton
    static let main = RazasPerrosRepository()
    
    var razas: [String] = ["Pastor Alemán", "French Poddle", "Chihuahueño"]
    
}

// Repositorio de valoración de futbolistas
class ValoracionesFutbolistasRepository {
    // Singleton
    static let main = ValoracionesFutbolistasRepository()
    
    var valoraciones: [(futbolista: String, valoracion: Int)] = [("Mbappe", 95), ("Ronaldo", 98), ("Messi", 90)]
}

// Extención para implementar UITableViewDataSource y UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Define cuantas secciones hay en la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Define cuál es el título para cada sección dada
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        //Swicth para proporcionar el titulo dependiendo la sección dada
        switch section {
        case 0: // Caso de razas de perros
            return "Razas de Perros"
        case 1: // Caso de valoracion de jugador
            return "Valoracion de futbolistas"
        default:
            return "Desconocido"
        }
    }
    
    // Define cuantas filas tendra cada sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Swicth para proporcionar las celdas, dependiendo la sección dada
        switch section {
        case 0: // Caso de razas de perros
            return RazasPerrosRepository.main.razas.count
        case 1: // Caso de valoracion de jugador
            return ValoracionesFutbolistasRepository.main.valoraciones.count
        default:
            return 0
        }
    }
    
    // Configuración de que y como se mostraran las celdas de cada sección deseada
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Recuperamos una celda desde tableView, pasandole su identificador "TableViewCell".
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!
        
        // Configurar la celda con su representacion
        switch indexPath.section {
        case 0: // Caso de razas de perros
            let raza = RazasPerrosRepository.main.razas[indexPath.row]
            cell.textLabel?.text = raza
        case 1: // Caso de valoracion de jugador
            let (jugador, valoracion) = ValoracionesFutbolistasRepository.main.valoraciones[indexPath.row]
            cell.textLabel?.text = jugador
            cell.detailTextLabel?.text = "\(valoracion)/100"
        default:
            print("ERROR")

        }
        // Devolver celda configurada
        return cell
    }
    /* Sección para que muestre que una celda fue seleccionada.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
     */
}

