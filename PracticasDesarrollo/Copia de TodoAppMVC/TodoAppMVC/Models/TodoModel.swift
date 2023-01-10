//
//  TodoModel.swift
//  TodoAppMVC
//
//  Created by MacBook on 02/01/23.
//

import Foundation
import CoreData

// El modelo representa los datos que seran retenidos durante la ejecucion y la forma de recuperarlos,
// actualizarlos, eliminarlos o generar nuevos datos

//**NOTA** Los modelos s edicen pasivos porque no dependen de otros componentes, es decir funcionan de forma aislada y solo si otro componente lo utiliza hace algo.

class TodoModel {
    
    /*
    // Colocamos una instancia global tipo singleton para poder acceder a nuestro modelo
    static let shared = TodoModel()
     */
    
    /// Establecemos el contenedor de coreData asociado al modelo
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TodoApp")
        
        container.loadPersistentStores {
            _, error in
            if let error = error {
                fatalError("No existe el congenedor \(error)")
            }
        }
        return container
    }()
    
    // Retenemos una lista de "TodoEntity"
    var todos: [TodoEntity] = []
    
    // Recupera todos los "Todos" desde el CoreData
    func loadTodos() {
        
        let context = self.persistentContainer.viewContext
        let requestTodos = TodoEntity.fetchRequest()
        
        if let todos = try? context.fetch(requestTodos) {
                self.todos = todos
        }
    } //
    
    // Regresamos un TodoEntity de un indice
    func getTodo(index: Int) -> TodoEntity? {
        
        guard index >= 0 && index <
                self.todos.count else { return nil }
        
        return self.todos[index]
    }
    
    // Agregamos nuevo "Todo" al CoreData
    func addTodo(title: String) -> TodoEntity? {
        
        let context = self.persistentContainer.viewContext
        
        let todo = TodoEntity(context: context)
        
        todo.id = Int32.random(in: 1...1000000)
        todo.title = title
        todo.checked = false
        todo.createAt = Date.now
        
        do {
            try context.save()
            self.loadTodos()
            return todo
        } catch {
            context.rollback()
        }
        return nil
    }
    
    // Actualizamos el titulo de un "Todo" y lo guardamos al CoreData
    func updateTodoTItle(index: Int, title: String) -> TodoEntity? {
        
        if let todo = self.getTodo(index: index) {
            todo.title = title
            todo.updateAt = Date.now
            
            let context = self.persistentContainer.viewContext
            
            do {
                try context.save()
                self.loadTodos()
                return todo
            } catch {
                context.rollback()
            }
        }
        return nil
    }
    
    // Actualizamos un "Todo" si ya esat checado y lo guardamos al CoreData
    func updateTodoCheck(index: Int, checked: Bool) -> TodoEntity? {
        
        if let todo = self.getTodo(index: index) {
            todo.checked = checked
            todo.updateAt = Date.now
            
            let context = self.persistentContainer.viewContext
            
            do {
                try context.save()
                self.loadTodos()
                return todo
            } catch {
                context.rollback()
            }
        }
        return nil
    }
    
    // Eliminamos un "Todo"
    func deleteTodo(index: Int) -> TodoEntity? {
        
        if let todo = self.getTodo(index: index) {
            
            let context = self.persistentContainer.viewContext
            
            context.delete(todo)
            
            do {
                try context.save()
                self.loadTodos()
                return todo
            } catch {
                context.rollback()
            }
        }
        return nil
    }
}
