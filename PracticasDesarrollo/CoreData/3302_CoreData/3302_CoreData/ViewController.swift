//
//  ViewController.swift
//  3302_CoreData
//
//  Created by MacBook on 21/12/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    /// **PASO 3** - Importar CoreData  y definir la variable para que nos ajuste
    var persistentContainer: NSPersistentContainer?

    // Conección de los texteField
    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var precioTextField: UITextField!
    
    @IBOutlet weak var existenciasTextField: UITextField!
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarProductos()
    }
    
    // Funcion que recupera los productos
    func cargarProductos() {
        if let context = persistentContainer?.viewContext {
            
            let requestProductos = Producto.fetchRequest()
            
            if let productos = try? context.fetch(requestProductos) {
                
                for producto in productos {
                    
                    print("El Producto con id [\(producto.id)], nombre \(producto.nombre!), tiene un costo de $\(producto.precio) y tiene  \(producto.existencias) existencias")
                    print("-----------------------------------------------------")
                }
                print("->->->->->->->->->->->->->->->->->->->->->->->-")
            }
        }
    }
    
    
    // Funcion que guarda los productos ingresados
    @IBAction func guardarAction(_ sender: Any) {
        
        // let producto = Producto(entity: Producto.entity(), insertInto: persistentContainer?.viewContext)
        
        if let context = persistentContainer?.viewContext {
            
            let producto = Producto(context: context)
            
            producto.id = Int32.random(in: 1...100)
            producto.nombre = nombreTextField.text
            producto.precio = Double(precioTextField.text ?? "0.0") ?? 0.0
            producto.existencias = Int32(existenciasTextField.text ?? "0") ?? 0
            
            do {
                try context.save()
                print("Producto guardado")
                // Resetear los textField
                nombreTextField.text = ""
                precioTextField.text = ""
                existenciasTextField.text = ""
                // Nos regresa al campo de nombreTextField
                nombreTextField.becomeFirstResponder()
                // Manadr a llamar par actualizar productos
                cargarProductos()
            } catch {
                context.rollback()
                print("No se pudo guardar el proyecto")
            }
        }
    }
}

