//
//  PlatillosModel.swift
//  RepasoCombine30-12-22
//
//  Created by MacBook on 30/12/22.
//
// Model: Encragado de retener datos, en este caso un platillo

import Foundation

/// Establece una entidad para almacenar o transportar datos
struct Platillo {
    
    let nombre: String
    let descripcion: String
    let precio: Double
}


/// EL modelo tiene la responsabilidad de retener los datos que viviran en
/// la aplicacion, en este caso todas las pantallas necesitaran saber o interactuar con el platillo selecionado.
class PlatillosModel {
    
    var platilloSeleccionado: Platillo?
    
}
