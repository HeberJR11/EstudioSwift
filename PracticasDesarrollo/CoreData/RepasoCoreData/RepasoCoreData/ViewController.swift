//
//  ViewController.swift
//  Tema: RepasoCoreData
//
//  Created by MacBook on 29/12/22.
//
/// Persistant Container = Modelo -> retiene entidades
///
/// Entidades = Cosas que necitamos almacenar ( Producto, persona, etc)
///
/// Context = NSManagerObjectContext = AdministradorDeObjeto(cocacola, julio, etc)
/// Guarda el objeto de manera persitente(save() o rollback()(omitir cambios), puede recuperar un objeto fetch(request), y podemos eliminar (delete())

import UIKit
import CoreData

class ViewController: UIViewController {
    
    /// **PASO 2** - Preparar a la vista para recibir el contenedor persistente que
    /// obtuvimos en SceneDelegate
    var appPersistentContainer: NSPersistentContainer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    /// **PASO 4** Utilizar el contenedor
        /// Los contenedores son consumidos a traves de su contexto() el cual es un administardor de
        /// objetos persistemntes generados por meido de las entidades(demoEntity, productoEntity)
        /// definidas en el modelo(appModel)
        
        /// El ocntexto del contenedor puede contener apliacr las siguientes operaciones:
        /// fetch() -> Recuperamos objetos persistentes desde contenedor
        /// save() -> Guardamos objetos persistentes nuevos o actualizamos hacia el contenedor
        /// delete () -> Elimina objetos persistentes sobre el contenedor
        
        // Obtenemos el contexto
        if let context = appPersistentContainer?.viewContext {
            
            // Vamos a crear un nuevo "DemoEntity" cada que la aplicacion cargue
            // y vamos a guardar el contexto
            
            // Se crea un variable para guardar al "DemoEntity" nuevo
            // Se crea un nuevo objeto persistente de la entidad "DemoEntity" en el contexto
            let demo = DemoEntity(context: context)
            // Accedemos a sus propiedades
            demo.id = Int64.random(in: 1...1000)
            demo.nombre = "Demo\(demo.id)"
            demo.pulsado = Bool.random()
            
            // Hasta aqui hay una nueva entidad en el contexto pero el contexto o ha sido guardado,
            // Se debe guardar para que todo lo ocurrido sea persistente
            
            do {
                try context.save()
                print("Se guardo el contexto exitosamente")
            } catch {
                // rollback desecha todos los cambios generados
                context.rollback()
                print("Se descartaron los cambios al contexto. Error \(error)")
            }
            
            // Vamos  recuperar todos los objetos persistentes
            // es decir rwecuperar la lista de objetos persistentes de l enidad"DemoEntity"
            
            // 1. Hacer una peticion de objetos persistentes
            let request = DemoEntity.fetchRequest()
            // 2. Solicitarle al contexto los objetos persistentes que cumplan la peticion
            if let demos = try? context.fetch(request) {
                // demos es de tipo [Entity]
                demos.forEach {
                    demo in
                    print("Id: \(demo.id), Nombre: \(demo.nombre ?? "SinNombre"), (\(demo.pulsado ? "PULSADO" : "SIN PULSAR"))")
                }
            }
        }
    }
}

