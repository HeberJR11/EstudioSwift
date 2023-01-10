//
//  HomeViewController.swift
//  RepasoCombine30-12-22
//
//  Created by MacBook on 30/12/22.
//
// Controlador: Encargado de toda la logica 

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var precioLabel: UILabel!
    
    
    
    // Generacion de suscriptor de platillos
    var platilloSeleccionadoSubscriber: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hacemos la suscripcion de el suscriptor al tunel
        platilloSeleccionadoSubscriber = PlatillosController.shared.platilloSeleccionadoSubject.sink(receiveValue: { platillo in
            
            self.nombreLabel.text = platillo.nombre
            self.precioLabel.text = "\(platillo.precio)"
            
            // Aqui ya hay un platillo seleccionado
            self.verDetallesButton.isEnabled = true
        })
    }

   
    
}
