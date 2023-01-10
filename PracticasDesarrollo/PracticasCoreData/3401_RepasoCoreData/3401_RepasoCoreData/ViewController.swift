//
//  ViewController.swift
//  3401_RepasoCoreData
//
//  Created by MacBook on 22/12/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var contadorLabel: UILabel!
    
    // Definir variable para
    // que nos ajusten el `persistentContainer`
    // es la instancia del contenedor 
    var appModel: NSPersistentContainer?
    
    var contador: Contador?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let context = appModel?.viewContext {
            // Traemos todos los contadores
            if let contador = try? context.fetch(Contador.fetchRequest()).first {
                
                self.contador = contador
                contadorLabel.text = "\(contador.conteo)"
            } else {
                self.contador = Contador(context: context)
            }
            
            if contador == nil {
                self.contador = Contador(context: context)
            }
        }
    }
    
    // Boton con la funcon de incremenatar
    @IBAction func incrementarAction(_ sender: Any) {
        print("Hi")
        
        if let contador = contador {
            contador.conteo += 1
            
            // Guardar el conteo
            // Todos los cambios realizados a los objetos
            // almacenados nuevos o existentes son guardados
            if let context = appModel?.viewContext {
                do {
                    try context.save()
                } catch {
                    context.rollback()
                }
            }
        }
    }
    
    
    @IBAction func decrementarAction(_ sender: Any) {
        
        if let contador = contador {
            contador.conteo -= 1
            if let context = appModel?.viewContext {
                do {
                    try context.save()
                } catch {
                    context.rollback()
                }
            }
        }
    }
}

