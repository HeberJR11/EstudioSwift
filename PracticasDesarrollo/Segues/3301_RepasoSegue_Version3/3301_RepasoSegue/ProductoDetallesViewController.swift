//
//  ProductoDetallesViewController.swift
//  3301_RepasoSegue
//
//  Created by MacBook on 21/12/22.
//

import UIKit

class ProductoDetallesViewController: UIViewController {
    
    // IBOutlet de los label
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var existenciasLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    
    // Variable que retendra el Producto que enviara la pantalla anterior
    var producto: Producto? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Si ya hay producto asociamos los valores a los label
        if let producto = producto {
            idLabel.text = "Id: \(producto.id)"
            nombreLabel.text = "Nombre: \(producto.nombre)"
            existenciasLabel.text = "Existencias: \(producto.existencias)"
            precioLabel.text = "Precio: \(producto.precio)"
        }
    }
}
