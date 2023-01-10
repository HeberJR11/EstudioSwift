//
//  SeleccionarPlatilloViewController.swift
//  RepasoDelegadoCombine
//
//  Created by MacBook on 30/12/22.
//

import UIKit

// Esta visat es pasiba, no conoce a nadie mas

class SeleccionarPlatilloViewController: UIViewController {
    
    /// Yo/vista) espero una función que reciba el  ombre del platillo y su precio.
    /// Pero, es posible que nadie me defina esa función.
    /// Entonces yo mismo deberia proponer un afuncionalidad por defecto.
    /// Esto significara que cuando yo selecciono un platillo, no hago nada pero si alguien mas me conecta una funcion con la misma firma podra hacer algo
    /// cuando yo seleccione un platillo y mande a llamar a esta funcion. Es decir, yo paso datos a "platillosSeleccionado" y alguien mas podria recibirlos
    /// fuera de aqui (otra vista, cun controlador, etc).
    
    // **PASO1** Definir una variable de tipo funcion con la firma esperada
    // para devolver los datos (transferencia de datos o salida)
    // **NOTA** El proceso de sacar datos de una pantalla a traves de una funcion se conoce como inyeccion inversa.
    
    // Func platilloSeleccionado(nombre: String, precio: Double)
                                // Recibo un String(omitido), Double(omitido)
    var platilloSeleccionado: (String, Double) -> Void = { _, _ in } // <- Clousure por defecto(vacio)

    @IBAction func seleccionarEnchiladasAction(_ sender: Any) {
        // **PASO2** Llamamos a la variable/funcion (delegado) para escapar los datos hacia el ultimo
        // que definio la funcion (por defecto nosotros mismos)
        self.platilloSeleccionado("Enchiladas", 50.0)
    }
    
    @IBAction func seleccionarChilaquilesAction(_ sender: Any) {
        self.platilloSeleccionado("Chilaquiles", 25.50)
    }
    
    @IBAction func seleccionarQuesadillasAction(_ sender: Any) {
        self.platilloSeleccionado("Quesadillas", 37.20)
    }
    
}
