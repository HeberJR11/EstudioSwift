//
//  PlatillosController.swift
//  RepasoCombine30-12-22
//
//  Created by MacBook on 30/12/22.
//

import Foundation
import Combine

class PlatillosController {
    
    // El controlador generalmente es un singleton 
    static let shared = PlatillosController()
    
    var model = PlatillosModel()
    
    // Sujeto capaz de pasar platillo a las vistas
    // Avisara cada que un platillo ha sido seleccionado (emisor/receptor de platillos)
    let platilloSeleccionadoSubject = PassthroughSubject<Platillo, Never>()
    
    func getPlatilloSeleccionado() -> Platillo? {
        return model.platilloSeleccionado
        //self.navigationController?.popViewController(animated: true)
        
    }
    
    // Aqui se hace la logica de la seleccion del platillo
    func seleccionarPlatillo(platillo: Platillo) {
        model.platilloSeleccionado = platillo
        print("Se selecciono el platillo: \(platillo)")
        // Enviamos el platillo al tunel
        platilloSeleccionadoSubject.send(platillo)
    }
}
