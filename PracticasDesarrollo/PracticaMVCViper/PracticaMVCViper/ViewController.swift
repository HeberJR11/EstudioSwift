/*
 Heber Eduardo Jimenez Rodriguez
 
 Creado el 23-12-22
 
 Práctica de MVC
 */

// tableViewCell = productoCell

import UIKit

struct Producto {
    
    let id: Int
    let nombre: String
    let precio: Double
    let existencias: Int
    // Variable calculada que regresa true si existencias es mayor a 0
    var hayExistencias: Bool { get { existencias > 0 } }
}

class ProductoModel {
    
    // Singleton de ProductoModel
    static let shared = ProductoModel()
    
    // Arreglo que almacena todos los pordeuctos existentes
    var productos: [Producto] = [Producto(id: 1, nombre: "Coca-cola", precio: 17.50, existencias: 10),
                                 Producto(id: 2, nombre: "Cerveza", precio: 22.30, existencias: 5),
                                 Producto(id: 3, nombre: "Sabritas", precio: 10.50, existencias: 6),
                                 Producto(id: 4, nombre: "Gansito", precio: 12.60, existencias: 9)]
}

class ProductoTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    static let shared = ProductoTableViewController()
    
    // Numero de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Titulo de la sección
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Productos"
    }
    
    // Numero de filas que queremos representar
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductoModel.shared.productos.count
    }
    
    // Configuración de como queremos se muestren las celdas.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Recuperar celda
        let cell = tableView.dequeueReusableCell(withIdentifier: "productoCell")!
        // Configurar la celda
        var configuracion = cell.defaultContentConfiguration()
        // Guardamos un producto en un a variable de forma correcta(dificil)
        let producto = ProductoModel.shared.productos[indexPath.row]
        configuracion.text = producto.nombre
        configuracion.secondaryText = "\(producto.precio)"
        cell.contentConfiguration = configuracion
        // Regresar la celda
        return cell
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var productosTableView: UITableView!
    
    // Función que se ejecuta siempre que se carga la vista
    override func viewDidLoad() {
        super.viewDidLoad()
        productosTableView.dataSource = ProductoTableViewController.shared
        productosTableView.delegate = ProductoTableViewController.shared
    }
}

