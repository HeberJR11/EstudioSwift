//
//  ViewController.swift
//  3301_RepasoSegue
//
//  Created by MacBook on 21/12/22.
//

// -> Datasource prevee los datos (fuentes de datos)
// -> Delegate es las aciiones (delegados)

import UIKit

class ViewController: UIViewController {
    
    // Boton
    @IBOutlet weak var myButton: UIButton!
    
    // Enlasamiento de myPickerView
    @IBOutlet weak var myPickerView: UIPickerView!
    
    // Enlazamiento de el myLabel
    @IBOutlet weak var myLabel: UILabel!
    
    var productoSeleccionado: Producto? = nil

    // Funcion viewDidLOad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Indicamos quein es el delegate y quien es el datasource
        myPickerView.delegate = self
        myPickerView.dataSource = self
    }
}

// Estructura roducto
struct Producto {
    let id: Int
    let nombre: String
    let precio: Double
    let existencias: Int
}


// Reositorio de Productos
class ProductosRepository {
    
    //Singleton
    static let main = ProductosRepository()
    
    // Generacion de productos de manera manual.
    var productos: [Producto] = [Producto(id: 1, nombre: "Coca", precio: 15.50, existencias: 5),
                                 Producto(id: 2, nombre: "Gansito", precio: 13.50, existencias: 2),
                                 Producto(id: 3, nombre: "Galletas", precio: 12.40, existencias: 4),
                                 Producto(id: 4, nombre: "Papel", precio: 8.0, existencias: 1),
                                 Producto(id: 5, nombre: "Aceite", precio: 20.30, existencias: 10),
                                 Producto(id: 6, nombre: "Chocolate", precio: 12.50, existencias: 25)]
}

// Extencion de ViewController para poder implementar UIPickerViewDataSource, UIPickerViewDelegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Función que indica el numero de componentes deseados
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Función que indica el numero de rodillos (filas) deseados
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ProductosRepository.main.productos.count
    }
    
    // Función que indica el titulo que queremos darle a cada rodillo
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Variable que recupera un producto en un inidce dado
        let producto = ProductosRepository.main.productos[row]
        // Recuperamos el producto con las propiedades requeridas y mostramos la información requerida
        return "\(producto.nombre) $\(producto.precio)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Rodillo \(component), fila \(row)")
            
        // Variable que recupera un producto en un inidce dado
        let producto = ProductosRepository.main.productos[row]
        
        productoSeleccionado = producto
        myButton.isEnabled = true
        // Recuperamos el producto con las propiedades requeridas y cambiamos el valor de myLabel
        myLabel.text = "\(producto.nombre) $\(producto.precio)"
    }
}

