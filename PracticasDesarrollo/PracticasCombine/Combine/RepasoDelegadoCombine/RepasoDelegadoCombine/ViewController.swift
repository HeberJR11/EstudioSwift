//
//  ViewController.swift
//  RepasoDelegadoCombine
//
//  Created by MacBook on 30/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var precioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seleccionarPlatilloSegue" {
            
            if let seleccionarPLatilloViewController = segue.destination as? SeleccionarPlatilloViewController {
                
                // **PASO3** Reemplazar la variable/funcion (delegado) para hacer otra cosa cuando
                // la variable/funcion sea llamada
                // **NOTA** Tenemos dos tipos de reemplazo, mediante una funcion normal o mediante una clausura
                
                seleccionarPLatilloViewController.platilloSeleccionado = {
                    nombre, precio in
                    self.nombreLabel.text = nombre
                    self.precioLabel.text = "$\(precio)"
                }
            }
        }
    }


    @IBAction func seleccionarPlatilloAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "seleccionarPlatilloSegue", sender: self)
        
    }
}

