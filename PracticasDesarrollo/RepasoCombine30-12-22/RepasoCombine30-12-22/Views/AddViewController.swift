//
//  AddViewController.swift
//  RepasoCombine30-12-22
//
//  Created by MacBook on 30/12/22.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func seleccionEnchiladasAction(_ sender: Any) {
        PlatillosController.shared.seleccionarPlatillo(platillo: Platillo(nombre: "Enchiladas", descripcion: "Tortilla con salsa verde", precio: 55.30))
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func chilaquilesSelectionAction(_ sender: Any) {
        PlatillosController.shared.seleccionarPlatillo(platillo: Platillo(nombre: "Chilaquiles", descripcion: "Tortilla en triangulos con salsa verde", precio: 50.30))
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func pambazoSelectionAction(_ sender: Any) {
        PlatillosController.shared.seleccionarPlatillo(platillo: Platillo(nombre: "Pambazo", descripcion: "Pan tipo telera, relleno de papa y chorizo, bañado en salsa guajillo", precio: 40.30))
        self.navigationController?.popViewController(animated: true)
    }

}
